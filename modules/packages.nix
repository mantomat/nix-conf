{ pkgs, ... }: {

  homebrew.enable = true;
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.cleanup = "zap";

  environment.systemPackages =
    with pkgs; [
      aerospace
      appcleaner
      bat
      claude-code
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
      zsh-syntax-highlighting
    ];

  homebrew.brews = [
    "mas"
  ];

  homebrew.casks = [
    "battery"
    "discord"
    "keyboardcleantool"
    "zen"
  ];

  # Install apps from the Mac App Store (requires `mas` login)
  homebrew.masApps = {
    "Bitwarden" = 1352778147;
    "WireGuard" = 1451685025;
  };
}
