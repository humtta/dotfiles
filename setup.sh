#!/usr/bin/env bash

set -eo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dotfiles_dir="${repo_dir}/dotfiles"

config_dir="${HOME}/.config"

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
for font in "${repo_dir}"/fonts/*.zip; do
	font_name="$(basename "${font}" .zip)"
	sudo unzip -o "${font}" -d "/usr/share/fonts/${font_name}"
done

sudo fc-cache -f

# Install agent skills
skills_repo_dir="${repo_dir}/../skills"

git clone https://github.com/humtta/skills "${skills_repo_dir}"
bash "${skills_repo_dir}/setup.sh"

# Symlink configuration files
symlink "${dotfiles_dir}/fish/config.fish" "${config_dir}/fish/config.fish"
symlink "${dotfiles_dir}/fish/functions/mkcd.fish" "${config_dir}/fish/functions/mkcd.fish"
symlink "${dotfiles_dir}/foot/config.ini" "${config_dir}/foot/foot.ini"
symlink "${dotfiles_dir}/git/config.ini" "${config_dir}/git/config"
