#!/usr/bin/env bash

set -e

ROOT="$(cd "$(dirname "$0")" && pwd)"

detect_gum() {
	if command -v gum >/dev/null 2>&1; then echo "gum"
		return
	fi

	os="$(uname -s | tr '[:upper:]' '[:lower:]')"
	arch="$(uname -m)"

	case "$arch" in
		x86_64) arch=amd64 ;;
		aarch64) arch=arm64 ;;
	esac

	gum_bin="$ROOT/bin/gum-$os-$arch"

	if [[ -x "$gum_bin" ]]; then
		echo "$gum_bin"
		return
	fi

	echo "bundled gum not available for $os/$arch
please install charmbracelet/gum or use install_select.sh instead" >&2
	exit 1
}

GUM="$(detect_gum)"

"$GUM" style --foreground "#cba6f7" "

██████╗ ███╗   ███╗ ██╗██████╗       ██╗  ██╗██╗   ██╗██████╗ ██████╗ 
██╔══██╗████╗ ████║███║╚════██╗      ██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗
██████╔╝██╔████╔██║╚██║ █████╔╝█████╗███████║ ╚████╔╝ ██████╔╝██████╔╝
██╔══██╗██║╚██╔╝██║ ██║██╔═══╝ ╚════╝██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗
██║  ██║██║ ╚═╝ ██║ ██║███████╗      ██║  ██║   ██║   ██║     ██║  ██║
╚═╝  ╚═╝╚═╝     ╚═╝ ╚═╝╚══════╝      ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝

"

modules=("scripts" "bash" "zsh" "alacritty" "kitty" "wezterm" "nvim" "hypr" "waybar" "rofi" "firefox")

OPTS=$("$GUM" choose \
	--no-limit \
	--header.foreground="#b4befe" \
	--cursor.foreground="#cba6f7" \
	--selected.foreground="#cba6f7" \
	--item.foreground="#ffffff" \
	"${modules[@]}")

[ -z "$OPTS" ] && exit 0

for module in $OPTS; do
	"$GUM" spin \
		--spinner dot \
		--spinner.foreground="#cba6f7" \
		--title "installing $("$GUM" style --foreground "#a6e3a1" --bold "$module")" \
		-- stow --verbose "$module"

	"$GUM" join $("$GUM" style --foreground "#a6e3a1" --bold "$module") " " $("$GUM" style --foreground "#ffffff" "installed")
done

echo

"$GUM" style --foreground "#a6e3a1" --bold "installation complete"
