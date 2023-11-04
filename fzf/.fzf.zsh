# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jaypopdev/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/jaypopdev/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jaypopdev/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/jaypopdev/.fzf/shell/key-bindings.zsh"

# ROSE PINE
   #export FZF_DEFAULT_OPTS="
	#--color=fg:#908caa,hl:#ebbcba
	#--color=fg+:#e0def4,hl+:#ebbcba
	#--color=border:#403d52,header:#31748f,gutter:#191724
	#--color=spinner:#f6c177,info:#9ccfd8,separator:#403d52
	#--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

# ROSE PINE MOON
    export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,hl:#ea9a97
	--color=fg+:#e0def4,hl+:#ea9a97
	--color=border:#44415a,header:#3e8fb0,gutter:#232136
	--color=spinner:#f6c177,info:#9ccfd8,separator:#44415a
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
