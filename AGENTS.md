# CLAUDE.md

This file provides guidance to agents when working with code in this repository.

## Commands

```bash
# Validate the flake
nix flake check

# Build for current system without applying
darwin-rebuild build --flake .

# Build for current system and apply
darwin-rebuild switch --flake .

# Format nix files
nix fmt

# Enter dev shell
nix develop
```

Always run `nix flake check && darwin-rebuild build --flake .` after editing any `.nix` file to verify the config before switching.

## Architecture

This is a **nix-darwin** configuration that uses `stow` to manage mutable dotfiles.

### Module layout

`modules/configuration.nix` is the root module — it imports every other module under `modules/`. Modules are split by concern:

### Dotfiles (`stow/`)

All dotfiles live under `stow/` and are managed by GNU Stow. On every `darwin-rebuild switch`, `post-activation.nix` automatically runs `stow --restow . --target=$HOME` from that directory, so files symlink into `~` matching the directory structure under `stow/`.

To manually re-link dotfiles without a full rebuild:
```bash
cd ~/nix-conf/stow && stow --restow . --target="$HOME"
```

### Backup

Restic backups to a local external drive (`/Volumes/MantoKopia/restic`) run hourly via launchd. Backup secrets (repo passwords, AWS keys) are stored in macOS Keychain. To initialise them on a new machine:
```bash
setup-backup-secrets
```
