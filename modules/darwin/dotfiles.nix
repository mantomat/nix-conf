{ ... }: {
    system.activationScripts.stowDotfiles.text =
''
#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles/stow/"
REPO_DIR="$HOME/dotfiles/"
REPO_URL="https://github.com/mntmtt/dotfiles.git"

# If dotfiles folder is not present, clone it from GitHub
if [ ! -d "$DOTFILES_DIR" ]; then
  echo ">> Cloning dotfiles repo..."
  git clone "$REPO_URL" "$REPO_DIR"
else
  echo ">> Dotfiles already cloned. Skipping pull."
fi

# Deploy dotfiles
cd "$DOTFILES_DIR"
stow --target="$HOME" .
'';
}
