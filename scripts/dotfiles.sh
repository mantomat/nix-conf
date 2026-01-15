#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/nix-conf/stow"
echo "[dotfiles] Stowing dotfiles..."
cd "$DOTFILES_DIR"
stow --restow . --target="$HOME" # keep an eye on this line (especially --restow)
echo "[dotfiles] Done."
