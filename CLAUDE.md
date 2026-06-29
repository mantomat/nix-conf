# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Validate the flake
nix flake check

# Build without applying
darwin-rebuild build --flake .#system

# Build and apply
darwin-rebuild switch --flake .#system

# Format nix files
nix fmt

# Enter dev shell (provides nil + nixd LSP)
nix develop
```

Always run `nix flake check && darwin-rebuild build --flake .#system` after editing any `.nix` file to verify the config before switching.

## Architecture

This is a **nix-darwin** configuration for a single macOS machine (`aarch64-darwin`). The flake exposes one `darwinConfigurations.system` output.

### Module layout

`modules/configuration.nix` is the root module — it imports every other module under `modules/`. Modules are split by concern:

| File | Purpose |
|---|---|
| `packages.nix` | Nix packages + Homebrew (brews/casks/MAS apps) |
| `system.nix` | macOS defaults, keyboard, dock, Finder, login |
| `fonts.nix` | Font packages |
| `network.nix` | Hostname and DNS |
| `launchd.nix` | Launch agents (Aerospace, Battery, Bitwarden) |
| `nix-zsh-paths.nix` | Writes nix store paths into `/etc/zsh/nix-zsh-paths` for `.zshrc` to source |
| `post-activation.nix` | Runs `stow --restow` after every rebuild to re-link dotfiles |
| `restic-backup.nix` | Backup shell scripts and scheduled launchd backup agents |

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
