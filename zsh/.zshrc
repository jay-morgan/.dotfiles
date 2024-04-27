export EDITOR='nvim'
export DAGGER=$HOME/.local/bin/:$PATH
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#d0d0d0,fg+:#ffffff,bg:#292522,bg+:#34302C
  --color=hl:#C1A78E,hl+:#C1A78E,info:#C1A78E,marker:#C1A78E
  --color=prompt:#C1A78E,spinner:#C1A78E,pointer:#C1A78E,header:#C1A78E
  --color=border:#C1A78E,label:#aeaeae,query:#d9d9d9
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> "
  --marker="->" --pointer="◆" --separator="─" --scrollbar="│"'

source ~/work/cst.sh

alias fs='eza --git --icons="always" --long --hyperlink --classify --all --changed --no-permissions --time-style="+%d-%m-%Y %H:%M" --sort="type" --colour="always" --header --mounts --accessed --extended --git-repos --level=1 --tree'
alias f='eza --git --icons="always" --long --hyperlink --classify --all --no-permissions --sort="type" --colour="always" --header --mounts --extended --git-repos --level=1 --tree --no-time --no-user'
alias b='broot'
alias bat='batcat'
alias n='nvim'
alias c='clear'
alias cp='xcp'
alias yb='yarn build'

bindkey -s ^f "~/.local/bin/tmux-sessionizer\n"
bindkey -s ^g "~/.local/bin/tmux-session-switcher\n"
bindkey -s ^h "~/.local/bin/tmux-windowizer\n" 
bindkey -s ^l "~/.local/bin/tmux-launcher\n" 

bindkey -s ^b "nvim ~/personal/.dotfiles/cli-commands.md\n"
bindkey -s ^v "nvim ~/personal/vim_commands.md\n"

plugins=(
	git
	zsh-navigation-tools
	tmux
	rust
	colorize
	httpie
	golang
	zsh-autosuggestions
	zsh-interactive-cd
	colored-man-pages
	kubectl
	kube-ps1
)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -s "/home/jaypopdev/.bun/_bun" ] && source "/home/jaypopdev/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[[ ! -r /home/jaypopdev/.opam/opam-init/init.zsh ]] || source /home/jaypopdev/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
export PATH="/home/jaypopdev/.turso:$PATH"

eval "$(starship init zsh)"

export FPATH="/home/jaypopdev/personal/eza/completions/zsh:$FPATH"
eval "$(zoxide init zsh)"

source /home/jaypopdev/.config/broot/launcher/bash/br

export PATH=$PATH:/home/jaypopdev/.local/bin
