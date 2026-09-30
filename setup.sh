#!/usr/bin/env bash

set -eo pipefail

# Project root directory
root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Configuration files directory
config_dir="${root_dir}/config"

# Usage: symlink SOURCE TARGET
#
# Creates a symlink at TARGET pointing to SOURCE. SOURCE must be relative to the
# config directory. Anything that already exists in TARGET will be overwritten.
function symlink() {
	local source_path="${config_dir}/${1}"
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

# Git
symlink 'git/git.ini' "${HOME}/.config/git/config"

# Crush
symlink 'crush/crush.sh' "${HOME}/.config/crush/crushrc"

# Foot
symlink 'foot/foot.ini' "${HOME}/.config/foot/foot.ini"
