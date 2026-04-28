{ pkgs, ... }:
{
  # TODO: Remove this temporary fix once direnv > 2.37.1 is released
  # or the upstream macOS test hang is resolved in nixpkgs.
  nixpkgs.overlays = [
    (final: prev: {
      direnv = prev.direnv.overrideAttrs (
        old:
        prev.lib.optionalAttrs prev.stdenv.hostPlatform.isDarwin {
          doCheck = false;
        }
      );
    })
  ];

  homebrew.enable = true;
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.cleanup = "uninstall";

  environment.systemPackages = with pkgs; [
    aerospace
    appcleaner
    bat
    claude-code
    direnv
    ffmpeg
    fzf
    git
    github-copilot-cli
    ghostty-bin
    neovim
    obsidian
    oh-my-zsh
    orbstack
    ripgrep
    restic
    stow
    tmux
    tree
    tree-sitter
    vscode
    zed-editor
    zsh-syntax-highlighting
  ];

  homebrew.brews = [
    "mas"
  ];

  homebrew.casks = [
    "battery"
    "discord"
    "ferdium"
    "keyboardcleantool"
    "zen"
  ];

  # Install apps from the Mac App Store (requires `mas` login)
  homebrew.masApps = {
    "Bitwarden" = 1352778147;
    "WireGuard" = 1451685025;
  };
}
