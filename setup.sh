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

# Crush
symlink 'crush/crush.sh' "${HOME}/.config/crush/crushrc"
