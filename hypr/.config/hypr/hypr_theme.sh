#!/bin/bash

if test -d "$HOME/.config/hypr/themes/$1/"; then
	echo "running"
	# Set Hyprland config
	rm ~/.config/hypr/look_and_feel.conf
	rm ~/.config/hypr/hyprpaper.conf
	rm ~/.config/hypr/plugins.conf

	ln -s ~/.config/hypr/themes/$1/look_and_feel.conf ~/.config/hypr/look_and_feel.conf
	ln -s ~/.config/hypr/themes/$1/hyprpaper.conf ~/.config/hypr/hyprpaper.conf
	ln -s ~/.config/hypr/themes/$1/plugins.conf ~/.config/hypr/plugins.conf

	# Set waybar config
	rm ~/.config/waybar/style.css
	rm ~/.config/waybar/config.jsonc

	ln -s ~/.config/waybar/$1/style.css ~/.config/waybar/style.css
	ln -s ~/.config/waybar/$1/config.jsonc ~/.config/waybar/config.jsonc

	# Set kitty theme
	rm ~/.config/kitty/theme.conf
	rm ~/.scripts/kitty_theme_hypr

	ln -s ~/.config/kitty/themes/Zen.conf ~/.config/kitty/theme.conf
	ln -s ~/.scripts/$1/kitty_theme_hypr ~/.scripts/kitty_theme_hypr

	# Set rofi theme
	rm ~/.config/rofi/config.rasi

	ln -s ~/.config/rofi/$1/config.rasi ~/.config/rofi/config.rasi

	# Reload everything

	# Reload Hyprland
	hyprctl reload > /dev/null

	# Reload hyprpaper
	killall hyprpaper
	hyprpaper > /dev/null &

	# Reload waybar
	killall waybar
	waybar &

	# Send SIGUSR1 signal to all instances of kitty to reload config
	killall -SIGUSR1 kitty
fi
