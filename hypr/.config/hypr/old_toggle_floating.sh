#!/bin/bash

STATE_FILE="$HOME/.config/hypr/floating_mode"

if [[ -f "$STATE_FILE" ]]; then
    hyprctl dispatch togglefloating all
    sed -i '/windowrulev2 = float, \class:.*/d' | tee ~/.config/hypr/floating.conf
    rm "$STATE_FILE"
    notify-send "Floating Mode Disabled"
else
    hyprctl dispatch togglefloating all
    echo 'windowrulev2 = float, class:.*' | tee ~/.config/hypr/floating.conf
    touch "$STATE_FILE"
    notify-send "Floating Mode Enabled"
fi

hyprctl dispatch togglefloating all

hyprctl reload
