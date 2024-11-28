local wezterm = require("wezterm")
local action = wezterm.action

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
config.window_background_opacity = 0.95
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.scrollback_lines = 2048
config.default_workspace = "home"
config.automatically_reload_config = true

-- Appearance
config.inactive_pane_hsb = {
	saturation = 0.5,
	brightness = 0.5,
}

-- Keys
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 3000 }
config.keys = {
	-- Send C-a when pressing C-a twice
	{ key = "a", mods = "LEADER", action = action.SendKey({ key = "a", mods = "CTRL" }) },
	{ key = "c", mods = "LEADER", action = action.ActivateCopyMode },

	-- Pane keybingings
	{ key = "-", mods = "LEADER", action = action.SplitVertical },
	{ key = "|", mods = "LEADER", action = action.SplitHorizontal },
	{ key = "h", mods = "LEADER", action = action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "LEADER", action = action.ActivatePaneDirection("Right") },
	{ key = "j", mods = "LEADER", action = action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = action.ActivatePaneDirection("Up") },

	-- Tab keybindings
	{ key = "n", mods = "LEADER", action = action.SpawnTab("CurrentPaneDomain") },
	{ key = "[", mods = "LEADER", action = action.ActivateTabRelative(-1) },
	{ key = "]", mods = "LEADER", action = action.ActivateTabRelative(1) },
}

-- Tabs

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = action.ActivateTab(i - 1),
	})
end

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
