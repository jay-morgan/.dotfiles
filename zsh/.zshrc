export EDITOR='nvim'
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export FPATH="/home/jaypopdev/personal/eza/completions/zsh:$FPATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#d0d0d0,fg+:#d0d0d0,bg:#292522,bg+:#34302C
  --color=hl:#C1A78E,hl+:#C1A78E,info:#C1A78E,marker:#C1A78E
  --color=prompt:#C1A78E,spinner:#C1A78E,pointer:#C1A78E,header:#C1A78E
  --color=border:#C1A78E,query:#d9d9d9
  --border="none" --preview-window="border-rounded" --prompt="> "
  --marker=">" --pointer="◆"
  --info="default"'
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/home/jaypopdev/.local/bin
# export PATH="$HOME/.emacs.d/bin:$PATH"
# export PATH="$HOME/.config/emacs/bin:$PATH"
# export DAGGER=$HOME/.local/bin/:$PATH
# [ -s "/home/jaypopdev/.bun/_bun" ] && source "/home/jaypopdev/.bun/_bun"
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"
# export PATH="/home/jaypopdev/.turso:$PATH"

alias fs='eza --git --icons="always" --long --hyperlink --classify --all --changed --no-permissions --time-style="+%d-%m-%Y %H:%M" --sort="type" --colour="always" --header --mounts --accessed --extended --git-repos --level=1 --tree'
alias f='eza --git --icons="always" --long --hyperlink --classify --all --no-permissions --sort="type" --colour="always" --header --mounts --extended --git-repos --level=1 --tree --no-time --no-user'
alias ff='eza --git --icons="always" --long --hyperlink --classify --all --no-permissions --sort="type" --colour="always" --header --mounts --extended --git-repos --level=5 --tree --no-time --no-user'
alias bat='batcat'
alias n='nvim'
alias c='clear'
alias cp='xcp'
alias yi='yarn install'
alias yb='yarn build'
# alias b='broot'

bindkey -s ^z "~/.local/bin/tmux-sessionizer\n"
bindkey -s ^x "~/.local/bin/tmux-session-switcher\n"
bindkey -s ^v "~/.local/bin/tmux-windowizer\n" 
bindkey -s ^l "~/.local/bin/tmux-launcher\n" 
bindkey -s ^b "nvim ~/personal/.dotfiles/cli-commands.md\n"
bindkey -s ^v "nvim ~/personal/vim_commands.md\n"

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
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions
source ~/work/cst.sh
# source /home/jaypopdev/.config/broot/launcher/bash/br
# [[ ! -r /home/jaypopdev/.opam/opam-init/init.zsh ]] || source /home/jaypopdev/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
