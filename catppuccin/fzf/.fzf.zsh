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

