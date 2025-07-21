#!/usr/bin/env bash
set -euo pipefail

DOTFILES_REPO="git@github.com:mantomat/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

echo "[dotfiles] Ensuring dotfiles are cloned..."

if [ ! -d "$DOTFILES_DIR" ]; then
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

echo "[dotfiles] Stowing dotfiles..."
cd "$DOTFILES_DIR/home"
stow --restow . --target="$HOME" # keep an eye on this line (especially --restow)

echo "[dotfiles] Done."
