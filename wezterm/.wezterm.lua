local wezterm = require 'wezterm'

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.window_decorations = 'None'
config.enable_tab_bar = false
config.custom_block_glyphs = true
config.scrollback_lines = 100000
config.color_scheme = 'rose-pine'
config.font = wezterm.font('BerkeleyMono Nerd Font Mono')
config.font_size = 13
config.line_height = 1.0
config.window_background_opacity = 0.9
config.window_close_confirmation = 'NeverPrompt'
config.default_prog = { "/bin/zsh", "-c", "~/personal/.dotfiles/.local/bin/tmux-launcher" }

return config
