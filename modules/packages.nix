{ pkgs, ... }:
{
  homebrew.enable = true;
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.cleanup = "uninstall";

  environment.systemPackages = with pkgs; [
    aerospace
    anki-bin
    appcleaner
    bat
    direnv
    codex
    ffmpeg
    fzf
    git
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
    "discord"
    "keyboardcleantool"
    "steam"
    "zen"
  ];

  homebrew.masApps = {
    "Bitwarden" = 1352778147;
    "WireGuard" = 1451685025;
    "Goodnotes: AI Notes, Docs, PDF" = 1444383602;
  };
}
