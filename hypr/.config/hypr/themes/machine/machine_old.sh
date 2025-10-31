# Set Hyprland config
rm ~/.config/hypr/look_and_feel.conf
rm ~/.config/hypr/hyprpaper.conf
rm ~/.config/hypr/plugins.conf

ln -s ~/.config/hypr/themes/machine/look_and_feel.conf ~/.config/hypr/look_and_feel.conf
ln -s ~/.config/hypr/themes/machine/hyprpaper.conf ~/.config/hypr/hyprpaper.conf
ln -s ~/.config/hypr/themes/machine/plugins.conf ~/.config/hypr/plugins.conf

# Set waybar config
rm ~/.config/waybar/style.css
rm ~/.config/waybar/config.jsonc

ln -s ~/.config/waybar/machine/style.css ~/.config/waybar/style.css
ln -s ~/.config/waybar/machine/config.jsonc ~/.config/waybar/config.jsonc

# Set kitty theme
rm ~/.config/kitty/theme.conf
rm ~/.scripts/kitty_theme_hypr

ln -s ~/.config/kitty/themes/Duotone_Lavender.conf ~/.config/kitty/theme.conf
ln -s ~/.scripts/machine/kitty_theme_hypr ~/.scripts/kitty_theme_hypr

# Set rofi theme
rm ~/.config/rofi/config.rasi

ln -s ~/.config/rofi/machine/config.rasi ~/.config/rofi/config.rasi

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
