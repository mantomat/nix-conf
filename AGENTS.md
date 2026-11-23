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

- Each `hosts/<name>/default.nix` defines the host and imports its shared and
  host-specific configuration.
- `shared/default.nix` imports the common modules, including
  `shared/macos-settings.nix` for macOS preferences and
  `shared/login-agents.nix` for launchd user agents.
- Hosts import modules from `optional/` when they use a feature. The MacBook
  opts into Restic through `hosts/mantomat-mba/backup.nix`.

### Dotfiles (`stow/`)

All dotfiles live under `stow/` and are managed by GNU Stow. The `drs` shell
function restows the dotfiles as the current user after a successful
`darwin-rebuild switch`. Follow the README on a fresh install to create
the initial symlinks and load `drs`.

To update the symlinks from the repo root:
```bash
stow --dir=stow --target="$HOME" --restow .
```

### Backup

Restic backups to a local external drive (`/Volumes/MantoKopia/restic`) run hourly via launchd. Backup secrets (repo passwords, AWS keys) are stored in macOS Keychain. To initialise them on a new machine:
```bash
setup-backup-secrets
```
