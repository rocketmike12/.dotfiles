#!/bin/bash

set -e

selection=""

for f in $(ls $HOME/.config/rm12-hypr/themes/); do
	selection="$selection$f\n"
done

THEME=$(echo -e $selection | rofi -dmenu -p "Theme:")

echo $THEME > ~/.config/rm12-hypr/theme

[ -d "$HOME/.config/hypr/themes/$1/" ] && exit 1

BASE="$HOME/.config/rm12-hypr/themes/$THEME"

if [ -f "$HOME/.config/alacritty/rm12-hypr.lock" ]
	ln -sf "$BASE/alacritty/theme.toml" "$HOME/.config/alacritty/theme.toml"
fi

if [ -f "$HOME/.mozilla/firefox/mike/chrome/rm12-hypr.lock" ]
	ln -sf "$BASE/firefox/theme.css" "$HOME/.mozilla/firefox/mike/chrome/theme.css"
fi

if [ -f "$HOME/.config/hypr/rm12-hypr.lock" ]
	ln -sf "$BASE/hypr/look_and_feel.conf" "$HOME/.config/hypr/look_and_feel.conf"
fi

if [ -f "$HOME/.config/kitty/rm12-hypr.lock" ]
	ln -sf "$BASE/kitty/theme.conf" "$HOME/.config/kitty/theme.conf"
fi

if [ -f "$HOME/.config/rofi/rm12-hypr.lock" ]
	ln -sf "$BASE/rofi/config.rasi" "$HOME/.config/rofi/config.rasi"
fi

if [ -f "$HOME/.config/waybar/rm12-hypr.lock" ]
	ln -sf "$BASE/waybar/config.jsonc" "$HOME/.config/waybar/config.jsonc"
	ln -sf "$BASE/waybar/style.css" "$HOME/.config/waybar/style.css"
fi

if [ -f "$HOME/.config/wezterm/rm12-hypr.lock" ]
	ln -sf "$BASE/wezterm/theme.lua" "$HOME/.config/wezterm/theme.lua"
fi

if [ -f "$HOME/.config/alacritty/rm12-hypr.lock" ]
	rm ~/.wallpaper
	ln -s ~/.wallpapers/$1/.wallpaper ~/.wallpaper
fi

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
