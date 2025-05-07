# nix-conf MacOs Config

## Instructions

1. Install the dependencies:
```bash
$ xcode-select --install
```

2. Install Nix:
```bash
$ curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
```

3. Install `nix-darwin` and apply the configuration:
```bash
$ nix run nix-darwin/master#darwin-rebuild -- build --flake .#mntmtt-mba
$ darwin-rebuild switch --flake .#mntmtt-mba
```
Note: this command will also clone and symlink the `https://github.com/mntmtt/dotfiles` repository.

