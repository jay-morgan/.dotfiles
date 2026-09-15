#!/usr/bin/env bash
# Offline tests for claude-session-registry and claude-resume-all.
#
# No real Claude Code, no network: a fake `claude` (argv[0] "claude", like the
# real bun binary) stands in for the parent process, and tmux runs on its own
# private server (-L, -f /dev/null) so the user's tmux is never touched.
#
#   tests/claude-session-resume.sh          # run everything
#   tests/claude-session-resume.sh -v       # also echo each assertion
#
# Must run outside the Claude Code bash sandbox: the sandbox hides parent pids
# (pid namespace) and blocks tmux sockets.
# shellcheck disable=SC2034  # variables are read inside the eval'd check() conditions
set -uo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
bin="$here/.local/bin"
work="$(mktemp -d "${TMPDIR:-/tmp}/claude-resume-test.XXXXXX")"
trap 'tmux -L "$sock" kill-server 2>/dev/null; rm -rf "$work"' EXIT
sock="cctest-$$"
verbose=0; [[ "${1:-}" == "-v" ]] && verbose=1
pass=0; fail=0

ok()   { pass=$((pass + 1)); (( verbose )) && printf '  ok   %s\n' "$1"; return 0; }
bad()  { fail=$((fail + 1)); printf '  FAIL %s\n' "$1"; }
check() { if eval "$2"; then ok "$1"; else bad "$1 :: $2"; fi; }   # name, condition

export CLAUDE_SESSION_REGISTRY="$work/registry.json"
export PATH="$bin:$PATH"
mkdir -p "$work/bin" "$work/shim" "$work/proj"
transcript="$work/proj/session.jsonl"
printf '{"type":"custom-title","customTitle":"Named Session","sessionId":"SID-1"}\n' > "$transcript"

# Fake claude: a bash process whose argv[0] is "claude", spawning the hook as a
# child exactly like Claude Code does. PAYLOAD is the hook JSON to feed it.
printf '#!/usr/bin/env bash\nclaude-session-registry upsert < "$PAYLOAD"\n' > "$work/bin/fake-claude-body"
printf '#!/usr/bin/env bash\nexec -a claude bash "%s" "$@"\n' "$work/bin/fake-claude-body" > "$work/bin/claude"
chmod +x "$work/bin/fake-claude-body" "$work/bin/claude"
# Stub claude for resume plumbing: records how it was called, then idles.
printf '#!/usr/bin/env bash\necho "STUB claude $*"; sleep 30\n' > "$work/bin/claude-stub"
chmod +x "$work/bin/claude-stub"; ln -sf "$work/bin/claude-stub" "$work/shim/claude"

payload() { # session_id [source]
  jq -n --arg sid "$1" --arg src "${2:-startup}" --arg tp "$transcript" --arg cwd "$work/proj" \
    '{session_id:$sid, cwd:$cwd, transcript_path:$tp, hook_event_name:"SessionStart", source:$src}'
}
reg() { jq -r "$1" "$CLAUDE_SESSION_REGISTRY" 2>/dev/null; }

echo "claude-session-registry"
payload HEADLESS-1 > "$work/p.json"
PAYLOAD="$work/p.json" "$work/bin/claude" -p hi </dev/null
check "claude -p with no tty is not recorded" '[[ ! -s "$CLAUDE_SESSION_REGISTRY" ]]'
PAYLOAD="$work/p.json" "$work/bin/claude" </dev/null
check "interactive flags but no tty is not recorded" '[[ ! -s "$CLAUDE_SESSION_REGISTRY" ]]'
payload SUB-1 | jq '. + {agent_id:"x"}' | claude-session-registry upsert
check "subagent payload is not recorded" '[[ ! -s "$CLAUDE_SESSION_REGISTRY" ]]'

payload SID-1 > "$work/p1.json"
tmux -L "$sock" -f /dev/null new-session -d -s unit -n hookwin -c "$work/proj" -x 120 -y 30 \
  "PAYLOAD=$work/p1.json CLAUDE_SESSION_REGISTRY=$CLAUDE_SESSION_REGISTRY $work/bin/claude; sleep 5"
sleep 2
check "tty session is recorded"          '[[ "$(reg ".[\"SID-1\"].cwd")" == "$work/proj" ]]'
check "tmux session name captured"       '[[ "$(reg ".[\"SID-1\"].tmux_session")" == "unit" ]]'
check "tmux window name captured"        '[[ "$(reg ".[\"SID-1\"].tmux_window_name")" == "hookwin" ]]'
check "claude pid captured"              '[[ "$(reg ".[\"SID-1\"].pid")" =~ ^[0-9]+$ ]]'
tmux -L "$sock" kill-server 2>/dev/null

started="$(reg '.["SID-1"].started_at')"; sleep 1
payload SID-1 resume | claude-session-registry upsert
check "upsert keeps started_at"          '[[ "$(reg ".[\"SID-1\"].started_at")" == "$started" ]]'
check "upsert records last source"       '[[ "$(reg ".[\"SID-1\"].last_source")" == "resume" ]]'
jq -n '{session_id:"SID-1", hook_event_name:"Stop"}' | claude-session-registry upsert
check "Stop refresh keeps source"        '[[ "$(reg ".[\"SID-1\"].last_source")" == "resume" ]]'
check "Stop refresh keeps tmux window"   '[[ "$(reg ".[\"SID-1\"].tmux_window_name")" == "hookwin" ]]'

jq -n '{session_id:"SID-1", hook_event_name:"SessionEnd", reason:"other"}' | claude-session-registry remove
check "reason=other keeps the entry"     '[[ "$(reg ".[\"SID-1\"].ended_reason")" == "other" ]]'
jq -n '{session_id:"SID-1", hook_event_name:"SessionEnd", reason:"prompt_input_exit"}' | claude-session-registry remove
check "prompt_input_exit removes it"     '[[ "$(reg "has(\"SID-1\")")" == "false" ]]'

payload GONE-1 | jq '.transcript_path="/nonexistent.jsonl"' | claude-session-registry upsert
claude-session-registry prune 2>/dev/null
check "prune drops missing transcripts"  '[[ "$(reg "has(\"GONE-1\")")" == "false" ]]'

echo 'not json' | claude-session-registry upsert 2>/dev/null; rc=$?
check "malformed payload exits 0"        '[[ $rc -eq 0 ]]'
printf '{broken' > "$CLAUDE_SESSION_REGISTRY"
payload SID-2 | claude-session-registry upsert 2>/dev/null; rc=$?
check "corrupt registry heals, exits 0"  '[[ $rc -eq 0 && "$(reg "has(\"SID-2\")")" == "true" ]]'
for i in $(seq 1 20); do payload "PAR-$i" | claude-session-registry upsert & done; wait
check "20 parallel upserts all land"     '[[ "$(reg "[keys[] | select(startswith(\"PAR-\"))] | length")" == "20" ]]'
check "registry still valid JSON"        'jq -e . "$CLAUDE_SESSION_REGISTRY" >/dev/null'

echo "claude-resume-all"
printf '{}\n' > "$CLAUDE_SESSION_REGISTRY"
payload SID-1 | claude-session-registry upsert
jq '.["SID-1"].tmux_session = "cortex"' "$CLAUDE_SESSION_REGISTRY" > "$work/r.tmp" && mv "$work/r.tmp" "$CLAUDE_SESSION_REGISTRY"
jq -n --arg tp "$transcript" --arg cwd "$work/proj" \
  '{session_id:"WORK-1", cwd:$cwd, transcript_path:$tp, source:"startup"}' \
  | CLAUDE_CONFIG_DIR="$HOME/.claude-work" claude-session-registry upsert
list="$(claude-resume-all --list)"
check "--list resolves the custom title" 'grep -q "Named Session" <<< "$list"'
dry="$(claude-resume-all --dry-run)"
check "--dry-run launches nothing"       'grep -q "2 launched" <<< "$dry"'
check "--dry-run shows work config dir"  'grep -q "claude-work" <<< "$dry"'
check "--only filters"                   '[[ "$(claude-resume-all --dry-run --only WORK-1 | tail -1)" == "1 launched, 1 skipped" ]]'
check "--max-age 0 skips today"          '[[ "$(claude-resume-all --dry-run --max-age -1 | tail -1)" == "0 launched, 2 skipped" ]]'

# Real launches against the private tmux server. tmux gives new panes the PATH of
# the client that creates them, so the stub must be on the PATH of the resume run.
PATH="$work/shim:$PATH" tmux -L "$sock" -f /dev/null new-session -d -s cortex -n "Named Session" -c "$work/proj" -x 120 -y 30
sleep 1
tmux() { command tmux -L "$sock" "$@"; }; export -f tmux; export sock
out="$(PATH="$work/shim:$PATH" claude-resume-all)"; sleep 2
check "launch reuses the idle window"    'grep -q "Named Session .* in cortex:0" <<< "$out"'
check "launch creates the work session"  'command tmux -L "$sock" has-session -t "=proj" 2>/dev/null'
check "window runs claude --resume"      'command tmux -L "$sock" list-panes -a -F "#{pane_start_command}" | grep -q -- "--resume SID-1"'
check "work window sets config dir"      'command tmux -L "$sock" list-panes -a -F "#{pane_start_command}" | grep -q "CLAUDE_CONFIG_DIR=.*claude-work claude --resume WORK-1"'
check "stub claude actually ran"         'command tmux -L "$sock" capture-pane -p -t cortex:0 | grep -q "STUB claude --resume SID-1"'
again="$(PATH="$work/shim:$PATH" claude-resume-all)"
check "second run is a no-op"            '[[ "$(tail -1 <<< "$again")" == "0 launched, 2 skipped" ]]'
unset -f tmux

echo
printf '%d passed, %d failed\n' "$pass" "$fail"
[[ $fail -eq 0 ]]
