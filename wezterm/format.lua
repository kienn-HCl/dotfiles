local wezterm = require("wezterm")

local function BaseName(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

local HEADER = ""

local SYMBOL_COLOR = { "#00bbff", "#a4a4a4" }
local FONT_COLOR = { "#dddddd", "#888888" }
local BACK_COLOR = { "#000000", "#202020" }
local HOVER_COLOR = "#434343"

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local index = tab.is_active and 1 or 2

	local bg = tab.is_active and 1 or 2
	local zoomed = tab.active_pane.is_zoomed and "🔎 " or " "

	return {
		{ Foreground = { Color = SYMBOL_COLOR[index] } },
		{ Background = { Color = BACK_COLOR[bg] } },
		{ Text = HEADER .. zoomed },

		{ Foreground = { Color = FONT_COLOR[index] } },
		{ Background = { Color = BACK_COLOR[bg] } },
		{ Text = BaseName(tab.active_pane.title) },
	}
end)
