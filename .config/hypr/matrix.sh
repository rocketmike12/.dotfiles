# Set Hyprland config
rm ~/.config/hypr/look_and_feel.conf
rm ~/.config/hypr/hyprpaper.conf

ln -s ~/.config/hypr/matrix/look_and_feel.conf ~/.config/hypr/look_and_feel.conf
ln -s ~/.config/hypr/matrix/hyprpaper.conf ~/.config/hypr/hyprpaper.conf

# Set waybar config
rm ~/.config/waybar/config.jsonc
rm ~/.config/waybar/style.css

ln -s ~/.config/waybar/matrix/config.jsonc ~/.config/waybar/config.jsonc
ln -s ~/.config/waybar/matrix/style.css ~/.config/waybar/style.css

# Set kitty theme
rm ~/.config/kitty/theme.conf
rm ~/.scripts/kitty_theme_hypr

ln -s ~/.config/kitty/themes/Base4Tone_Classic_L_Custom.conf ~/.config/kitty/theme.conf
ln -s ~/.scripts/matrix/kitty_theme_hypr ~/.scripts/kitty_theme_hypr

# Set rofi theme
rm ~/.config/rofi/config.rasi

ln -s ~/.config/rofi/matrix/config.rasi ~/.config/rofi/config.rasi

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
