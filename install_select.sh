#!/usr/bin/env bash

set -e

categories=("modules" "profiles" "DONE")
modules=("scripts" "wallpapers" "bash" "zsh" "alacritty" "kitty" "wezterm" "nvim" "hypr" "waybar" "rofi" "firefox" "DONE")
profiles=("hyprland (hypr + waybar + rofi + scripts)" "nvim (nvim + tmux + alacritty)" "all" "DONE")

PS3="select installation category: "
selected=$(
	select opt1 in "${categories[@]}"; do
		case "$opt1" in
			modules)
				PS3="select module to install: "
				select opt2 in "${modules[@]}"; do
					case "$opt2" in 
						DONE)
							break
							;;
						*)
							echo "$opt2"
							;;
					esac
				done

				break
				;;

			profiles)
				PS3="select profile to install: "
				select opt2 in "${profiles[@]}"; do
					case "$REPLY" in 
						1)
							echo "hypr waybar rofi scripts"
							;;
						2)
							echo "nvim tmux alacritty"
							;;
						3)
							echo "scripts wallpapers bash zsh alacritty kitty wezterm nvim hypr waybar rofi firefox"
							;;
						4)
							break
							;;
					esac
				done

				break
				;;

			DONE)
				break
				;;
		esac
	done
)
