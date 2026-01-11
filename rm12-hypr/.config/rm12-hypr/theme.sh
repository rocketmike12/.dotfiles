#!/bin/bash

selection=""

for f in $(ls "$HOME/.config/rm12-hypr/themes/"); do
	selection="$selection$f\n"
done

selection=${selection%\\n}

THEME=$(echo -e $selection | rofi -dmenu -p "Theme:")

[ ! -d "$HOME/.config/rm12-hypr/themes/$1" ] && exit 1

echo "theme: $THEME"

echo $THEME > ~/.config/rm12-hypr/theme

BASE="$HOME/.config/rm12-hypr/themes/$THEME"
WALLPAPER="$HOME/.config/rm12-hypr/wallpapers/$THEME/wallpaper"

if [[ -f "$HOME/.config/hypr/rm12-hypr.lock" && -d "$BASE/hypr" ]]; then
	echo "setting hypr"

	ln -sf "$BASE/hypr/look_and_feel.conf" "$HOME/.config/hypr/look_and_feel.conf"
	ln -sf "$WALLPAPER" "$HOME/.config/rm12-hypr/wallpaper"

	hyprctl reload > /dev/null
	swww img ~/.config/rm12-hypr/wallpaper --transition-type wipe --transition-fps 120 --transition-duration 1
fi

if [[ -f "$HOME/.config/waybar/rm12-hypr.lock" && -d "$BASE/waybar" ]]; then
	echo "setting waybar"

	ln -sf "$BASE/waybar/config.jsonc" "$HOME/.config/waybar/config.jsonc"
	ln -sf "$BASE/waybar/style.css" "$HOME/.config/waybar/style.css"

	killall waybar
	waybar & > /dev/null
fi

if [[ -f "$HOME/.config/rofi/rm12-hypr.lock" && -d "$BASE/rofi" ]]; then
	echo "setting rofi"

	ln -sf "$BASE/rofi/config.rasi" "$HOME/.config/rofi/config.rasi"
fi

if [[ -f "$HOME/.config/alacritty/rm12-hypr.lock" && -d "$BASE/alacritty" ]]; then
	echo "setting alacritty"

	ln -sf "$BASE/alacritty/theme.toml" "$HOME/.config/alacritty/theme.toml"

	touch ~/.config/alacritty/alacritty.toml
fi

if [[ -f "$HOME/.config/kitty/rm12-hypr.lock" && -d "$BASE/kitty" ]]; then
	echo "setting kitty"

	ln -sf "$BASE/kitty/theme.conf" "$HOME/.config/kitty/theme.conf"

	killall -q -SIGUSR1 kitty
fi

if [[ -f "$HOME/.config/wezterm/rm12-hypr.lock" && -d "$BASE/wezterm" ]]; then
	echo "setting wezterm"

	ln -sf "$BASE/wezterm/theme.lua" "$HOME/.config/wezterm/theme.lua"

	touch ~/.wezterm.lua
fi

if [[ -f "$HOME/.mozilla/firefox/mike/chrome/rm12-hypr.lock" && -d "$BASE/firefox" ]]; then
	echo "setting firefox"

	ln -sf "$BASE/firefox/theme.css" "$HOME/.mozilla/firefox/mike/chrome/theme.css"
fi
