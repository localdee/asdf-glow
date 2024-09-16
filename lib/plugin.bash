#!/usr/bin/env bash
# shellcheck disable=SC2034

set -euo pipefail

# CUSTOMIZE
extract_release() {
	local release_file
	release_file="$1"
	local extract_dir
	extract_dir="$2"

	tar -xzf "$release_file" -C "$extract_dir" --strip-components=1
}

# CUSTOMIZE
get_download_url() {
	local tool_name
	tool_name="$1"
	local gh_repo
	gh_repo="$2"
	local version
	version="$3"
	local platform
	platform="$4"
	local arch
	arch="$5"
	local processor
	processor="$6"

	local build
	case "${platform}" in
	darwin)
		if [[ "${arch}" == "x86_64" ]]; then
			build='Darwin_x86_64'
		else
			build='Darwin_arm64'
		fi
		;;
	linux)
		if [[ "${arch}" == "x86_64" ]]; then
			build='Linux_x86_64'
		elif [[ "${arch}" == "x86" ]]; then
			build='Linux_i386'
		else
			build='Linux_arm64'
		fi
		;;
	*)
		build='xxx'
		;;
	esac

	# https://github.com/charmbracelet/glow/releases/download/v2.0.0/glow_2.0.0_Darwin_arm64.tar.gz
	echo -n "${gh_repo}/releases/download/v${version}/${tool_name}_${version}_${build}.tar.gz"
}

# CUSTOMIZE
list_github_tags() {
	local gh_repo
	gh_repo="$1"

	git ls-remote --tags --refs "${gh_repo}" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//' |
		grep -v rc |
		grep -v nightly
	# NOTE: You might want to adapt this sed to remove non-version strings from tags
}

list_all_versions() {
	local gh_repo
	gh_repo="$1"

	# TODO: Adapt this. By default we simply list the tag names from GitHub releases.
	# Change this function if air has other means of determining installable versions.
	list_github_tags "${gh_repo}"
}
