###COMMAND LINE

C - b - open this document!
C - i - open chtsh script
C - l - run tmux launcher
C - f - run tmux sessionizer
C - r - run fzf
C - d - EOF signal, close recursively

tldr {subject name} - gives output od most common commands - short version of man cli tool. eg: tldr git worktree
ccat - coloured output file
man man - manual for how to use manuals
man (app) - manual for app, eg man tmux - example: man git worktree
cht.sh - cheat sheet cli
/tmp/ - error log dir - use cat for items in here. use bash to help log debug info

### TMUX (all have ctrl + a prefix, unless stated otherwise)

shift + d - look for a todo.md in current dir, create one if not. Make notes where you are
ctrl + d - end of file signal, recusively close tmux upwards
tmux ls - list all sessions i

PREFIX + [ - ENABLE SCROLLBACK, up, down etc to navigate or vim keybinds
PREFIX + i - OPEN CHEATSHEET
PREFIX + l - GO TO PREVIOUS SESSION!
PREFIX + w - OPEN SESSION/WINDOW NAVIGATION
PREFIX + c - new window
PREFIX + p - previous window
PREFIX + n - next window


##

man tmux - show manual (man man - shows how to use manual)

Alias 		Command 			Description
ta "some name" 	tmux attach -t 			Attach to already running named session
tad "some name" tmux attach -d -t 		Detach named tmux session
ts "some name" 	tmux new-session -s 		Create a new named tmux session
tl 		tmux list-sessions 		Displays a list of running tmux sessions
tksv 		tmux kill-server 		Terminate all running tmux sessions
tkss 		tmux kill-session -t 		Terminate named running tmux session
tmux 		_zsh_tmux_plugin_run 		Start a new tmux session
tmuxconf 	$EDITOR $ZSH_TMUX_CONFIG 	Open .tmux.conf file with an editor

## Sessions (no prefix)

tmux new-session -d -n "some name" - creates new detached session
tl - list sessions

# Navigation

shift + 9 - (open parethesis) navigate left session
shift + 0 - (close parenthesis) navigate right session

## Windows

w - show/navigate between windows in a session
c - new window

# Navigation

n - next window
p - previous window
(# number) - for window number

## CLI comms
tmux new-window - creates new window in attached session 

ta 	tmux attach -t 	Attach new tmux session to already running named session
tad 	tmux attach -d -t 	Detach named tmux session
ts 	tmux new-session -s 	Create a new named tmux session
tl 	tmux list-sessions 	Displays a list of running tmux sessions
tksv 	tmux kill-server 	Terminate all running tmux sessions
tkss 	tmux kill-session -t 	Terminate named running tmux session

##MANUAL SESSION MANAGEMENT (currently auto saves every 15mins)

Save: Press Ctrl-b (or your custom prefix key), then while holding Ctrl, press s.

Restore: Press Ctrl-b (or your custom prefix key), then while holding Ctrl, press r.!
