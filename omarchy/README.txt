Omarchy dotfiles - custom hooks for omarchy Linux

Stow target: ~/.config/omarchy/
Usage:  stow --target=~/.config/omarchy --dir=~/git/.dotfiles omarchy

This creates symlinks:
  ~/.config/omarchy/hooks/theme-set -> ~/git/.dotfiles/omarchy/hooks/theme-set

Contents:
  hooks/theme-set  - Syncs omarchy desktop theme colours to Obsidian's
                     Minimal theme via CSS snippet. Runs automatically
                     on `omarchy-theme-set`.
