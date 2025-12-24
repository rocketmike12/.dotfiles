# .dotfiles
My dotfiles repo. Contains files for my Hyprland setup and my LXQt setup, as well as some applications.

## WARNING:
DO NOT RUN hypr/.config/hypr/hypr_theme.sh (it will try to remove your configs for most programs in this repo and replace them with mine). I will rework it and add an installation script soon.

Until then all configs that require separate theme files are broken by default, you'll have to symlink theme files by hand if you REALLY want to use those configs.

Currently broken configs:

 - alacritty
 - firefox
 - hypr
 - kitty
 - rofi
 - waybar
 - kitty_theme_hypr script (redundant anyway, unless you use multiple DEs/WMs)
 - wezterm

***

<details>
<summary>Hyprland</summary>

<ul>
<li>
<details> 
<summary>Hyprland</summary>

### Machine
![screenshot](.resources/machine_00.png)
![screenshot](.resources/machine_01.png)
![screenshot](.resources/machine_02.png)
![screenshot](.resources/machine_03.png)
![screenshot](.resources/machine_04.png)

### Matrix
![screenshot](.resources/matrix_00.png)
![screenshot](.resources/matrix_01.png)
![screenshot](.resources/matrix_02.png)

### Night
![screenshot](.resources/night_00.png)
![screenshot](.resources/night_01.png)
![screenshot](.resources/night_02.png)
![screenshot](.resources/night_04.png)
![screenshot](.resources/night_05.png)

### Zen
![screenshot](.resources/zen_00.png)
![screenshot](.resources/zen_01.png)
![screenshot](.resources/zen_02.png)
![screenshot](.resources/zen_03.png)

</details>
</li>
<li>
<details>
<summary>Waybar</summary>

### Config based on [MubinMuhammad's config](https://github.com/MubinMuhammad/MinimalSwayFX/tree/main/waybar)
![waybar screenshot](.resources/machine_waybar.png)
![waybar screenshot](.resources/matrix_waybar.png)
![waybar screenshot](.resources/night_waybar.png)
![waybar screenshot](.resources/zen_waybar.png)

</details>
</li>
</ul>
