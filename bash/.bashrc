# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Use these for time logging armory script
# export JIRA_EMAIL="jay.morgan@i6.io"

# Source secrets (API tokens, PATs — not committed anywhere)
[[ -f ~/.env.secrets ]] && source ~/.env.secrets

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
eval "$(mise activate bash)"
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
# git
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gst='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gl='git log --oneline'
alias glg='git log --oneline --graph'
alias gb='git branch'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gsw='git switch'
alias gsc='git switch -c'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gr='git rebase'
alias gri='git rebase -i'
alias gm='git merge'
alias gs='git stash'
alias gsp='git stash pop'
alias grs='git restore'
alias grss='git restore --staged'
# worktree (for bare repo setup)
# alias gw='git --git-dir=.bare worktree'
# alias gwa='git --git-dir=.bare worktree add'
# alias gwl='git --git-dir=.bare worktree list'
# alias gwr='git --git-dir=.bare worktree remove'
# alias gwp='git --git-dir=.bare worktree prune'
# alias gwm='git --git-dir=.bare worktree move'
# alias gwlk='git --git-dir=.bare worktree lock'
# alias gwul='git --git-dir=.bare worktree unlock'
# alias gwrp='git --git-dir=.bare worktree repair'
# Func to add a new worktree from the bare repo, using origin/develop as default
# branch to base it on. Creates a worktree and branch of the same name.
# Must be run from the directory containing the .bare repo.
# Can specify a different branch as 2nd arg, local or remote.
#
# Examples:
# gwab feature-x main            # from main
# gwab feature-x origin/main     # from origin/main
# gwab feature-x release/2.0     # from release/2.0
# gwab() {
  # git --git-dir=.bare worktree add -b "$1" "$1" "${2:-develop}"
# }
# remove worktree and branches
# gwrm() {
  # git --git-dir=.bare worktree remove "$1" && \
  # git --git-dir=.bare branch -d "$1"
# }
# claude (dual account: personal default, work via CLAUDE_CONFIG_DIR)
# Models: personal = fable (settings.json), work = opus. ANTHROPIC_MODEL beats the
# settings.json "model" key, which the bind-mount service re-hardlinks from Cortex at
# boot for BOTH accounts, so the work model must come from the environment.
alias pclaude='claude'
alias wclaude='CLAUDE_CONFIG_DIR=$HOME/.claude-work ANTHROPIC_MODEL=opus claude'
alias cr='claude --resume'
alias wcr='wclaude --resume'
# Multi-session dashboard (agents view). Both logins open it by default
# (`defaultToAgentsView` in .claude.json, toggle: /config -> "Open agents view by default").
# Same screen as pressing Left on an empty prompt inside a session.
alias ca='claude agents'
alias wca='wclaude agents'
# Alt-c resumes personal claude, Alt-w resumes work claude
# (macro: jump to end, kill the line, type the alias, hit enter)
bind '"\ec": "\C-e\C-ucr\C-m"'
bind '"\ew": "\C-e\C-uwcr\C-m"'

# yarn
alias y='yarn'
alias ya='yarn add'
alias yad='yarn add -D'
alias yr='yarn remove'
alias yd='yarn dev'
alias yb='yarn build'
alias yt='yarn test'
alias ys='yarn start'
alias yi='yarn install'
alias yo='yarn outdated'
alias yu='yarn upgrade'
alias yw='yarn workspace'
alias ywl='yarn workspaces list'
alias yc='yarn cache clean'
# kubectl
alias k='kubectl'
alias kg='kubectl get'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgd='kubectl get deployments'
alias kgn='kubectl get nodes'
alias kga='kubectl get all'
alias kd='kubectl describe'
alias kdp='kubectl describe pod'
alias kds='kubectl describe svc'
alias kdd='kubectl describe deployment'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias ke='kubectl exec -it'
alias ka='kubectl apply -f'
alias kdel='kubectl delete'
alias kdelf='kubectl delete -f'
alias kctx='kubectl config use-context'
alias kns='kubectl config set-context --current --namespace'
alias kpf='kubectl port-forward'
alias kr='kubectl rollout'
alias krs='kubectl rollout status'
alias krr='kubectl rollout restart'
# Enable thefuck
eval "$(thefuck --alias)"

eval "$(navi widget bash)"

jjwatch() {
  watchexec --workdir "${1:-.}" -e md,rs,py,js,ts,sh \
    -- jj --ignore-working-copy status
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/sovereign/google-cloud-sdk/path.bash.inc' ]; then . '/home/sovereign/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/sovereign/google-cloud-sdk/completion.bash.inc' ]; then . '/home/sovereign/google-cloud-sdk/completion.bash.inc'; fi

# Jira time-logging morning prompt — Mon-Thu, first interactive shell of the day
alias jira-log='node ~/Cortex/armory/scripts/submit-time.mjs'
alias jira-last='node ~/Cortex/armory/scripts/last-logged.mjs'
# Scripted dry-run + submit; unresolved lines offer claude "/log-time" reconciliation.
# Marker untouched while unresolved lines remain unhandled, so next shell re-prompts.
bash ~/Cortex/armory/scripts/morning-time-check.sh

# >>> grok installer >>>
export PATH="$HOME/.grok/bin:$PATH"
[[ -r "$HOME/.grok/completions/bash/grok.bash" ]] && source "$HOME/.grok/completions/bash/grok.bash"
# <<< grok installer <<<







































# >>> cve-tui >>>
export CVE_REPO_DIR="/home/sovereign/Cortex/forge/projects/.work/cve-slayer"
[ -f "$CVE_REPO_DIR/scripts/shell/cve.sh" ] && source "$CVE_REPO_DIR/scripts/shell/cve.sh"
# <<< cve-tui <<<

# Turso
export PATH="$PATH:/home/sovereign/.turso"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/sovereign/.lmstudio/bin"
# End of LM Studio CLI section

