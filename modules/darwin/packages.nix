{ pkgs, ... }: {

  # Policy: if it's on nixpkgs, install it from there.
  # Otherwise, install it from Brew.

  environment.systemPackages =
    with pkgs; [
      # system-wide productivity
      raycast
      aerospace

      # social
      discord

      # learning
      # anki # marked as broken, temporarily installed via brew
      obsidian

      # terminal
      # ghostty # marked as broken, temporarily installed via brew
      tmux
      oh-my-zsh
      zsh-syntax-highlighting

      # system utilities
      # kopia-ui # not avalable on aarch64/darwin, temporarily installed via brew
      rclone

      # editors
      ripgrep
      tree-sitter
      neovim
      jetbrains.idea-ultimate
      jetbrains.clion

      # development
      # TODO see if it's better to install these system-wide or to use nix dev environments
      mercurial
      python313
      rustup
      clang
      jdk # jdk21 at the moment
      luajit

      # dotfiles
      stow
    ];

  homebrew.enable = true;
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.cleanup = "zap";

  homebrew.brews = [
    "mas"
    "jenv"
  ];

  homebrew.casks = [
    "battery"
    "bettermouse"
    "keyboardcleantool"
    "orbstack"
    "zen"
    "ghostty"
    "kopiaui"
    "anki"
  ];

  # Install apps from the Mac App Store (requires `mas` login)
  homebrew.masApps = {
    "Bitwarden" = 1352778147;
  };
}
