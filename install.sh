#!/usr/bin/env sh
set -eu

config="$(mktemp)"
trap 'rm -f "$config"' EXIT

curl -fsSL \
  "https://raw.githubusercontent.com/timomeh/dotfiles/refs/heads/main/.config/mise/config.toml" \
  -o "$config"

MISE_GLOBAL_CONFIG_FILE="$config" mise trust "$config"

MISE_GLOBAL_CONFIG_FILE="$config" mise bootstrap --dry-run
