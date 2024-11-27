local wezterm = require("wezterm")

local config = {}

-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
config.color_scheme = "Tokyo Night Storm"
config.font = wezterm.font_with_fallback({
	{ family = "Hack Nerd Font", scale = 1.5 },
	{ family = "Courier New", scale = 1.5 },
})
config.window_background_opacity = 0.85
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.scrollback_lines = 2048
config.default_workspace = "home"
config.automatically_reload_config = true

-- Tabs
config.use_fancy_tab_bar = false
config.status_update_interval = 1000

-- Right status
wezterm.on("update-right-status", function(window)
	local time = wezterm.strftime("%-H:%M %p")

	window:set_right_status(wezterm.format({
		{ Text = wezterm.nerdfonts.md_clock .. " " .. time },
	}))
end)

return config
