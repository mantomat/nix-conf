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
$ nix run nix-darwin/master#darwin-rebuild -- build --flake .#mantomat
$ darwin-rebuild switch --flake .#mantomat
```
Note: this command will also clone and symlink the `https://github.com/mantomat/dotfiles` repository.

