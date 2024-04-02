local wezterm = require("wezterm")

if wezterm.config_builder then
	config = wezterm.config_builder()
end
--config.color_scheme = "Gigavolt (base16)"
--config.color_scheme = "Github"
-- config.color_scheme = "Github (Gogh)"
--config.color_scheme = "DanQing Light (base16)"
-- config.color_scheme = "Dark Violet (base16)"
--config.color_scheme = "darkmatrix"
--config.color_scheme = "darkermatrix"
--config.color_scheme = "dawnfox"
--config.color_scheme = 'Operator Mono Dark'
--config.color_scheme = "OneHalfDark"

config.window_decorations = "None"
config.enable_tab_bar = false
config.custom_block_glyphs = true
config.scrollback_lines = 100000

--config.color_scheme = "rose-pine"
--config.color_scheme = "Tokyo Night"
--config.window_background_opacity = 0.9
--config.font_size = 17

config.color_scheme = "Mono Theme (terminal.sexy)"
config.window_background_opacity = 0.9
config.font_size = 13

config.font = wezterm.font("BerkeleyMono Nerd Font Mono")
--config.font = wezterm.font("BerkeleyMono Nerd Font Mono", { italic = false })

--config.line_height = 1

config.window_close_confirmation = "NeverPrompt"
config.default_prog = { "/bin/zsh", "-c", "~/personal/.dotfiles/.local/bin/tmux-launcher" }

-- Set background to same color as neovim
--config.colors = {}
--config.colors.background = "#111111"

-- required for nvim zen mode
wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
		else
			overrides.font_size = number_value
		end
	end
	window:set_config_overrides(overrides)
end)

return config
