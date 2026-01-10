#!/bin/bash

selection=""

for f in $(ls $HOME/.config/rm12-hypr/themes/); do
	selection="$selection$f\n"
done

selected=$(echo -e $selection | rofi -dmenu -p "Theme:")

echo $selected > ~/.config/rm12-hypr/theme
