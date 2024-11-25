local wezterm = require("wezterm")

config = wezterm.config_builder()

config = {
        automatically_reload_config = true,
        enable_tab_bar = false,
        window_close_confirmation = "NeverPrompt",
        -- window_decorations = "RESIZE",
        default_cursor_style = "BlinkingBar",
        color_scheme = "Tokyo Night Storm",
        font = wezterm.font("Hack Nerd Font", { weight = "Regular" }),
        font_size = 16,
}

return config
