#!/usr/bin/env bash

set -eo pipefail

# Project root directory
root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Configuration files directory
config_dir="${root_dir}/config"

# Usage: symlink SOURCE TARGET
#
# Creates a symlink at TARGET pointing to SOURCE. Anything that already exists
# in TARGET will be overwritten.
function symlink() {
	local source_path="${1}"
	local target_path="${2}"

	if [[ ! -e "${source_path}" ]]; then
		echo "Error: source not found: ${source_path}" >&2
		exit 1
	fi

	mkdir -p "$(dirname "${target_path}")"
	ln -fns "${source_path}" "${target_path}"
}

# Install fonts
for font in fonts/*.zip; do
	font_name="$(basename "${font}" .zip)"
	sudo unzip -o "${font}" -d "/usr/share/fonts/${font_name}"
done

sudo fc-cache -f

# Fish
symlink "${config_dir}/fish/config.fish" "${HOME}/.config/fish/config.fish"

# Git
symlink "${config_dir}/git/config.ini" "${HOME}/.config/git/config"

# Crush
symlink "${config_dir}/crush/config.sh" "${HOME}/.config/crush/crushrc"

# Foot
symlink "${config_dir}/foot/config.ini" "${HOME}/.config/foot/foot.ini"
