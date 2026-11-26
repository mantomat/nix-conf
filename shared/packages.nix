{ pkgs, ... }:
{
  homebrew.enable = true;
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.cleanup = "uninstall";

  environment.systemPackages = with pkgs; [
    anki-bin
    appcleaner
    bat
    codex
    direnv
    ffmpeg
    fzf
    git
    ghostty-bin
    neovim
    obsidian
    oh-my-zsh
    omniwm
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
  ];

  homebrew.casks = [
    "discord"
    "keyboardcleantool"
    "zen"
  ];

  programs.mas = {
    enable = true;
    update = true;
    packages = {
      Bear = 1091189122;
      Bitwarden = 1352778147;
      Xcode = 497799835;
    };
  };

}
