# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"

alias ls1='eza --git --icons="always" --long --hyperlink --classify --all --changed --no-permissions --time-style="+%d-%m-%Y %H:%M" --sort="type" --colour="always" --header --mounts --accessed --extended --git-repos --level=1 --tree'

alias c='clear'

alias f='eza --git --icons="always" --long --hyperlink --classify --all --changed --no-permissions --time-style="+%d-%m-%Y %H:%M" --sort="type" --colour="always" --header --mounts --accessed --extended --git-repos --level=1 --tree'

alias fs='eza --git --icons="always" --long --hyperlink --classify --all --no-permissions --sort="type" --colour="always" --header --mounts --extended --git-repos --level=1 --tree --no-time --no-user'


alias ls2='eza --git --icons="always" --long --hyperlink --classify --all --changed --no-permissions --time-style="+%d-%m-%Y %H:%M" --sort="type" --colour="always" --header --mounts --accessed --extended --git-repos --level=2 --tree'

alias f2='eza --git --icons="always" --long --hyperlink --classify --all --changed --no-permissions --time-style="+%d-%m-%Y %H:%M" --sort="type" --colour="always" --header --mounts --accessed --extended --git-repos --level=2 --tree'

alias fs2='eza --git --icons="always" --long --hyperlink --classify --all --no-permissions --sort="type" --colour="always" --header --mounts --extended --git-repos --level=2 --tree --no-time --no-user'

alias b='batcat'
alias bat='batcat'
alias cat='batcat'

alias n='nvim'

alias cp='xcp'

# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# tmux session starting
bindkey -s ^f "~/.local/bin/tmux-sessionizer\n"

#tmux session switching
bindkey -s ^g "~/.local/bin/tmux-session-switcher\n"

# open cli-command list
bindkey -s ^b "nvim ~/personal/.dotfiles/cli-commands.md\n"

# open nvim commands 
bindkey -s ^v "nvim ~/personal/vim_commands.md\n"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

#ZSH_THEME="af-magic"
ZSH_THEME="robbyrussell"
#ZSH_THEME="theunraveler"
#ZSH_THEME="eastwood"
#ZSH_THEME="simple"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# add repo for zsh syntax plugin (requires repo and linked path below: https://github.com/zsh-users/zsh-syntax-highlighting)

### TEMPORARIALLY REMOVED ###
#source ~/.oh-my-zsh/custom/syntax-highlighting/zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh





# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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
#	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath+=${ZDOTDIR:-~}/.zsh_functions

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/jaypopdev/.bun/_bun" ] && source "/home/jaypopdev/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# opam configuration
[[ ! -r /home/jaypopdev/.opam/opam-init/init.zsh ]] || source /home/jaypopdev/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Turso
export PATH="/home/jaypopdev/.turso:$PATH"

# add starship prompt line
eval "$(starship init zsh)"

#echo "
#      ███                                                   
#     ░░░                                                    
#     █████  ██████   █████ ████ ████████   ██████  ████████ 
#    ░░███  ░░░░░███ ░░███ ░███ ░░███░░███ ███░░███░░███░░███
#     ░███   ███████  ░███ ░███  ░███ ░███░███ ░███ ░███ ░███
#     ░███  ███░░███  ░███ ░███  ░███ ░███░███ ░███ ░███ ░███
#     ░███ ░░████████ ░░███████  ░███████ ░░██████  ░███████ 
#     ░███  ░░░░░░░░   ░░░░░███  ░███░░░   ░░░░░░   ░███░░░  
# ███ ░███             ███ ░███  ░███               ░███     
#░░██████             ░░██████   █████              █████    
# ░░░░░░               ░░░░░░   ░░░░░              ░░░░░     
# "

#ccat << 'EOF'
# ____________________________________________________
#|                                                    |
#|      ██╗ █████╗ ██╗   ██╗██████╗  ██████╗ ██████╗  |
#|      ██║██╔══██╗╚██╗ ██╔╝██╔══██╗██╔═══██╗██╔══██╗ |
#|      ██║███████║ ╚████╔╝ ██████╔╝██║   ██║██████╔╝ |
#| ██   ██║██╔══██║  ╚██╔╝  ██╔═══╝ ██║   ██║██╔═══╝  |
#| ╚█████╔╝██║  ██║   ██║   ██║     ╚██████╔╝██║      |
#|  ╚════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝      ╚═════╝ ╚═╝      |
#|____________________________________________________|
#​
#EOF

ccat << 'EOF'
​
​
      ██╗ █████╗ ██╗   ██╗██████╗  ██████╗ ██████╗  
      ██║██╔══██╗╚██╗ ██╔╝██╔══██╗██╔═══██╗██╔══██╗ 
      ██║███████║ ╚████╔╝ ██████╔╝██║   ██║██████╔╝ 
 ██   ██║██╔══██║  ╚██╔╝  ██╔═══╝ ██║   ██║██╔═══╝  
 ╚█████╔╝██║  ██║   ██║   ██║     ╚██████╔╝██║      
  ╚════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝      ╚═════╝ ╚═╝      
​
​
EOF

#cat << 'EOF'
#   ..                 ..                                                 
#  888>               @L           .d``                u.    .d``         
#  "8P         u     9888i   .dL   @8Ne.   .u    ...ue888b   @8Ne.   .u   
#   .       us888u.  `Y888k:*888.  %8888:u@88N   888R Y888r  %8888:u@88N  
# u888u. .@88 "8888"   888E  888I   `888I  888.  888R I888>   `888I  888. 
#`'888E  9888  9888    888E  888I    888I  888I  888R I888>    888I  888I 
#  888E  9888  9888    888E  888I    888I  888I  888R I888>    888I  888I 
#  888E  9888  9888    888E  888I  uW888L  888' u8888cJ888   uW888L  888' 
#  888E  9888  9888   x888N><888' '*88888Nu88P   "*888*P"   '*88888Nu88P  
#  888E  "888*""888"   "88"  888  ~ '88888F`       'Y"      ~ '88888F`    
#  888E   ^Y"   ^Y'          88F     888 ^                     888 ^      
#  888E                     98"      *8E                       *8E        
#  888P                   ./"        '8>                       '8>        
#.J88"                  ~`           "                         "         
#EOF

#cat << 'EOF'
#  ___
#________                                      
#______(_)_____ _____  _______________________ 
#_____  /_  __ `/_  / / /__  __ \  __ \__  __ \
#____  / / /_/ /_  /_/ /__  /_/ / /_/ /_  /_/ /
#___  /  \__,_/ _\__, / _  .___/\____/_  .___/ 
#/___/          /____/  /_/           /_/      
#
#EOF

#echo "
#      ███                                                
#     ░░░                                                 
#     █████ ██████  █████ ████████████   ██████  ████████ 
#    ░░███ ░░░░░███░░███ ░███░░███░░███ ███░░███░░███░░███
#     ░███  ███████ ░███ ░███ ░███ ░███░███ ░███ ░███ ░███
#     ░███ ███░░███ ░███ ░███ ░███ ░███░███ ░███ ░███ ░███
#     ░███░░████████░░███████ ░███████ ░░██████  ░███████ 
#     ░███ ░░░░░░░░  ░░░░░███ ░███░░░   ░░░░░░   ░███░░░  
# ███ ░███           ███ ░███ ░███               ░███     
#░░██████           ░░██████  █████              █████    
# ░░░░░░             ░░░░░░  ░░░░░              ░░░░░     
#"



fs #list files
ccat << 'EOF'
​
EOF
export FPATH="/home/jaypopdev/personal/eza/completions/zsh:$FPATH"
eval "$(zoxide init zsh)"

source /home/jaypopdev/.config/broot/launcher/bash/br
