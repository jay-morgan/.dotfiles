local wezterm = require("wezterm")

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.warn_about_missing_glyphs = false
config.window_decorations = "RESIZE"
config.custom_block_glyphs = true
config.scrollback_lines = 100000
config.adjust_window_size_when_changing_font_size = false
config.window_close_confirmation = "NeverPrompt"
local act = wezterm.action
config.keys = {
	{
		key = "f",
		mods = "CTRL",
		action = act.Search({ CaseInSensitiveString = "" }),
	},
}

config.font_size = 12
-- config.line_height = 1
-- config.color_scheme = "rose-pine"
-- config.color_scheme = "Tokyo Night"
-- config.color_scheme = "Marrakesh (dark) (terminal.sexy)"
-- config.color_scheme = "Nord (base16)"
-- config.color_scheme = "Mono Theme (terminal.sexy)"
-- config.window_background_opacity = 0.9

wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				overrides.window_background_opacity = config.window_background_opacity
				number_value = number_value - 1
			end
		elseif number_value < 0 then
			overrides.window_background_opacity = config.window_background_opacity
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
		else
			overrides.window_background_opacity = 1
			overrides.font_size = number_value
		end
	end
	window:set_config_overrides(overrides)
end)

function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return wezterm.color.load_scheme("/home/jaypopdev/personal/.dotfiles/wezterm/melange_dark.toml")
	else
		return wezterm.color.load_scheme("/home/jaypopdev/personal/.dotfiles/wezterm/melange_light.toml")
	end
end

config.colors = scheme_for_appearance(get_appearance())

config.use_fancy_tab_bar = false
config.enable_scroll_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.tab_bar_at_bottom = true
config.freetype_load_target = "HorizontalLcd"

-- Set background to same color as neovim
-- config.colors = {}
-- config.colors.background = "#111111"

config.font = wezterm.font_with_fallback({
	"BerkeleyMono Nerd Font Mono",
	"nonicons",
})

return config
