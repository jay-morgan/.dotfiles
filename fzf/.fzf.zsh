# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jaypopdev/.local/share/nvim/lazy/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/jaypopdev/.local/share/nvim/lazy/fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/jaypopdev/.local/share/nvim/lazy/fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/home/jaypopdev/.local/share/nvim/lazy/fzf/shell/key-bindings.zsh"
