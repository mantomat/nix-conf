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
    ```

6. Install `nix-darwin` and apply the configuration:
    ```bash
    $ nix run nix-darwin/master#darwin-rebuild -- build --flake .#mantomat
    $ sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake .#mantomat
    ```

## Backup

In order to run the backups, setup the secrets:
```bash
setup-backup-secrets
```

