# nix-conf MacOs Config

## Home, configuration and dotfiles

1. Install the dependencies (git, etc.):

   ```bash
   $ xcode-select --install
   ```

2. Install Homebrew:

   ```bash
   $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

3. Install Nix:

   ```bash
   $ curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
     sh -s -- install
   ```

4. Load the ssh key or create one, then login to GitHub.

5. Clone the nix-conf repo:

   ```bash
   $ git clone git@github.com:mantomat/nix-conf.git
   $ cd nix-conf
   ```

6. Build the MacBook configuration from `flake.lock` and apply it with the
   `darwin-rebuild` that the build provides. For another Mac, use the name
   of its entry in `darwinConfigurations`.

   ```bash
   $ nix build .#darwinConfigurations.mantomat-mba.system
   $ sudo ./result/sw/bin/darwin-rebuild switch --flake .
   ```

7. From the repo root, link the dotfiles as your user.

   ```bash
   $ /run/current-system/sw/bin/stow --dir=stow --target="$HOME" --restow .
   ```

   If Stow reports conflicts, back up the conflicting files or merge their
   contents into `stow/` before retrying. Open a new terminal to load `drs`.
   For subsequent changes, `drs` switches the system and restows the dotfiles
   after a successful switch.

## Backup

The MacBook's [backup configuration](hosts/mantomat-mba/backup.nix) sets the
local Restic repository, the paths to back up, the interval in seconds, and the
daily prune time. To enable backups on another host, import the
[optional Restic module](optional/restic-backup.nix) and set its
`services.resticLocalBackup` options.

To set up the backup secrets, run:

```bash
setup-backup-secrets
```
