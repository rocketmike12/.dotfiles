#!/bin/bash

if test -d "$HOME/.config/hypr/themes/$1/"; then
	# Set theme file
	echo $1 > ~/.hypr_theme

	# Set Hyprland config
	rm ~/.config/hypr/look_and_feel.conf

	ln -s ~/.config/hypr/themes/$1/look_and_feel.conf ~/.config/hypr/look_and_feel.conf

	# Set wallpaper
	rm ~/.wallpaper
	ln -s ~/.wallpapers/$1/.wallpaper ~/.wallpaper

	# Set waybar config
	rm ~/.config/waybar/style.css
	rm ~/.config/waybar/config.jsonc

	ln -s ~/.config/waybar/$1/style.css ~/.config/waybar/style.css
	ln -s ~/.config/waybar/$1/config.jsonc ~/.config/waybar/config.jsonc

	# Set kitty theme
	rm ~/.config/kitty/theme.conf
	rm ~/.scripts/kitty_theme_hypr

	ln -s ~/.config/kitty/themes/$1/theme.conf ~/.config/kitty/theme.conf
	ln -s ~/.scripts/$1/kitty_theme_hypr ~/.scripts/kitty_theme_hypr

	# Set alacritty theme
	rm ~/.config/alacritty/theme.toml

	ln -s ~/.config/alacritty/themes/$1/theme.toml ~/.config/alacritty/theme.toml

	# Set wezterm theme
	rm ~/.config/wezterm/theme.lua

	ln -s ~/.config/wezterm/$1/theme.lua ~/.config/wezterm/theme.lua

	# Set rofi theme
	rm ~/.config/rofi/config.rasi

	ln -s ~/.config/rofi/$1/config.rasi ~/.config/rofi/config.rasi

	# Set firefox theme
	rm ~/.mozilla/firefox/mike/chrome/theme.css
	
	ln -s ~/.mozilla/firefox/mike/chrome/themes/$1/theme.css ~/.mozilla/firefox/mike/chrome/theme.css

	## Reload everything

	# Reload Hyprland
	hyprctl reload > /dev/null

	# Show wallpaper
	swww img ~/.wallpaper --transition-type wipe --transition-fps 120 --transition-duration 1

	# Reload waybar
	killall waybar
	waybar &

	# Send SIGUSR1 signal to all instances of kitty to reload config
	killall -SIGUSR1 kitty

	# Reload alacritty config
	touch ~/.config/alacritty/alacritty.toml

	# Reload wezterm config
	touch ~/.wezterm.lua

	# Reload neovim
	nvr --servername ~/.nvimsocket --remote-send ":source ~/.config/nvim/lua/config/colorscheme.lua<CR>"
fi
