export EDITOR='nvim'
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export FPATH="/home/sovereign/personal/eza/completions/zsh:$FPATH"
export PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=bg+:#34302C
  --color=hl:#C1A78E,hl+:#C1A78E,info:#C1A78E,marker:#C1A78E
  --color=prompt:#C1A78E,spinner:#C1A78E,pointer:#C1A78E,header:#C1A78E
  --color=border:#C1A78E,query:#C1A78E
  --border="none" --preview-window="border-rounded" --prompt="> "
  --marker=">" --pointer=">"
  --info="default"'
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:$HOME/.local/bin

alias fs='eza --git --icons="always" --long --hyperlink --classify --all --changed --no-permissions --time-style="+%d-%m-%Y %H:%M" --sort="type" --colour="always" --header --mounts --accessed --extended --git-repos --level=1 --tree'
alias f='eza --git --icons="always" --long --hyperlink --classify --all --no-permissions --sort="type" --colour="always" --header --mounts --extended --git-repos --level=1 --tree --no-time --no-user'
alias ff='eza --git --icons="always" --long --hyperlink --classify --all --no-permissions --sort="type" --colour="always" --header --mounts --extended --git-repos --level=2 --tree --no-time --no-user'
alias cat='ccat'
alias bat='batcat'
alias n='nvim'
alias c='clear'
alias cp='xcp'
alias yi='yarn install'
alias yb='yarn build'
alias yt='yarn test'

bindkey -s ^z "~/.local/bin/tmux-sessionizer\n"
bindkey -s ^x "~/.local/bin/tmux-session-switcher\n"
bindkey -s ^v "~/.local/bin/tmux-windowizer\n"
bindkey -s ^l "~/.local/bin/tmux-launcher\n"
bindkey -s ^b "nvim ~/git/.dotfiles/cli-commands.md\n"
bindkey -s ^n "nvim .\n"

plugins=(
	git
	colorize
	httpie
	golang
	zsh-autosuggestions
	zsh-interactive-cd
	colored-man-pages
	kubectl
	kube-ps1
)
fpath+=${ZDOTDIR:-~}/.zsh_functions

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/sovereign/google-cloud-sdk/path.zsh.inc' ]; then . '/home/sovereign/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/sovereign/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/sovereign/google-cloud-sdk/completion.zsh.inc'; fi

