local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.font = wezterm.font 'Hack'
config.font_size = 12

local TMEcolor = wezterm.color.get_builtin_schemes()['Catppuccin Mocha'];
TMEcolor.ansi[1] = '#120d16'
TMEcolor.brights[1] = '#1f1626'

config.color_schemes = {
	['TME'] = TMEcolor,
}
config.color_scheme = 'TME';

-- config.color_scheme = 'Catppuccin Mocha'
config.colors = {
	-- background = "#070008",
	background = "#0a000c",

	selection_fg = "#000000",
	selection_bg = "#f5e0dc",

	split = "#cba6f7"
}

-- config.background = {
-- 	{
-- 		source = { File = "/home/mike/Pictures/retrowave_dark_purple_field.jpg" },
-- 		hsb = { brightness = 0.04 }
-- 	}
-- }

config.tab_bar_at_bottom = true

config.hide_tab_bar_if_only_one_tab = true

local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

wezterm.on(
	'format-tab-title',
	function(tab, tabs, panes, config, hover, max_width)
		local title = tab_title(tab)
		if tab.is_active then
			return {
				{ Background = { Color = "rgba(0, 0, 0, 0)" } },
				{ Foreground = { Color = "#39092c" } },
				{ Text = SOLID_LEFT_ARROW },
				{ Background = { Color = "#39092c" } },
				{ Foreground = { Color = "#f5e0dc" } },
				{ Text = "  " .. tab.tab_index + 1 .. " " .. title .. "  " },
				{ Background = { Color = "rgba(0, 0, 0, 0)" } },
				{ Foreground = { Color = "#39092c" } },
				{ Text = SOLID_RIGHT_ARROW },
			}

		else
			return {
				{ Background = { Color = "rgba(0, 0, 0, 0)" } },
				{ Foreground = { Color = "#28071f" } },
				{ Text = SOLID_LEFT_ARROW },
				{ Background = { Color = "#28071f" } },
				{ Foreground = { Color = "#f5e0dc" } },
				{ Text = "  " .. tab.tab_index + 1 .. " " .. title .. "  " },
				{ Background = { Color = "rgba(0, 0, 0, 0)" } },
				{ Foreground = { Color = "#28071f" } },
				{ Text = SOLID_RIGHT_ARROW },
			}
		end
	end
)

config.keys = {
	{
		key = '\'',
		mods = 'CTRL',
		action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
	},
	{
		key = ';',
		mods = 'CTRL',
		action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
	},
	{
		key = "h",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection('Left')
	},
	{
		key = "j",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection('Down')
	},
	{
		key = "k",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection('Up')
	},
	{
		key = "l",
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection('Right')
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize { 'Left', 2 }
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize { 'Down', 2 }
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize { 'Up', 2 }
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = wezterm.action.AdjustPaneSize { 'Right', 2 }
	}
}

return config
