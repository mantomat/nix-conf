{ pkgs, ... }:
{
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
    zsh-syntax-highlighting
  ];

  homebrew.brews = [
    "mas"
  ];

  homebrew.casks = [
    "discord"
    "keyboardcleantool"
    "zen"
    "zed" # currently installed from homebrew since hydra fails build
  ];

  homebrew.masApps = {
    "Bitwarden" = 1352778147;
    "WireGuard" = 1451685025;
    "Goodnotes: AI Notes, Docs, PDF" = 1444383602;
  };
}
