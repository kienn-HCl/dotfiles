local wezterm = require 'wezterm'
return{
    font_size = 10,
    line_height = 0.9,
    text_background_opacity = 1,
    --color_scheme = "Nocturnal Winter",
    color_scheme = "NightLion v2",
    use_fancy_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    window_frame = {
        font_size = 8,
        font = wezterm.font { family = 'Roboto', weight = 'Bold' },
        active_titlebar_bg = '#333333',
        inactive_titlebar_bg = '#333333',
    },
    colors = {
        tab_bar = {
        -- The color of the inactive tab bar edge/divider
        inactive_tab_edge = '#575757',
        },
    },
    keys = {
        {
            key = 'h',
            mods = 'ALT',
            action = wezterm.action.SplitPane {
                direction = 'Left',
                size = { Percent = 50 },
            },
        },
        {
            key = 'l',
            mods = 'ALT',
            action = wezterm.action.SplitPane {
                direction = 'Right',
                size = { Percent = 50 },
            },
        },
        {
            key = 'j',
            mods = 'ALT',
            action = wezterm.action.SplitPane {
                direction = 'Down',
                size = { Percent = 50 },
            },
        },
        {
            key = 'k',
            mods = 'ALT',
            action = wezterm.action.SplitPane {
                direction = 'Up',
                size = { Percent = 50 },
            },
        },
        {
            key = 'f',
            mods = 'ALT',
            action = wezterm.action.SplitPane {
                direction = 'Right',
                command = { args = { 'gotop' } },
                size = { Percent = 50 },
            },
        },
    },
}
