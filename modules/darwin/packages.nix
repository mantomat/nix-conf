{ pkgs, ... }: {

  homebrew.enable = true;
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.cleanup = "zap";

  environment.systemPackages =
    with pkgs; [
      aerospace
      appcleaner
      bat
      ffmpeg
      fzf
      hunspell
      luajit
      neovim
      nixpkgs-fmt
      obsidian
      oh-my-zsh
      pyenv
      raycast
      rclone
      ripgrep
      rustup
      stow
      tmux
      tree
      tree-sitter
      typst
      typstyle
      vscode
      zsh-syntax-highlighting
    ];

  homebrew.brews = [
    "jenv"
    "mas"
  ];

  homebrew.casks = [
    "battery"
    "discord"
    "ghostty"
    "keyboardcleantool"
    "kopiaui"
    "orbstack"
    "zen"
  ];

  # Install apps from the Mac App Store (requires `mas` login)
  homebrew.masApps = {
    "Bitwarden" = 1352778147;
    "WireGuard" = 1451685025;
  };
}
