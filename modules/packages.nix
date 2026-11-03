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
    zotero
    zsh-syntax-highlighting
  ];

  # 2026-10 zotero currently uses firefox 140 -- allow it for now
  nixpkgs.config.permittedInsecurePackages = [
      "firefox-esr-140-bin-unwrapped-140.17.0esr"
  ];

  homebrew.brews = [
    "mas"
  ];

  homebrew.casks = [
    "discord"
    "keyboardcleantool"
    "nvidia-geforce-now"
    "steam"
    "zen"
  ];

  homebrew.masApps = {
    "Bitwarden" = 1352778147;
    "WireGuard" = 1451685025;
    "Goodnotes: AI Notes, Docs, PDF" = 1444383602;
  };
}
