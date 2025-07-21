{ pkgs, ... }: {

  # Policy: if it's on nixpkgs, install it from there.
  # Otherwise, install it from Brew.

  environment.systemPackages =
    with pkgs; [
      # system-wide productivity
      raycast
      aerospace
      chatgpt
      obsidian
      discord

      # shell, terminal & CLI software
      zsh
      oh-my-posh
      oh-my-zsh
      # ghostty # marked as broken, temporarily installed via brew
      tmux

      # system utilities
      # kopia-ui # not avalable on aarch64/darwin, temporarily installed via brew
      rclone
      htop-vim

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
    "shottr"
  ];

  # Install apps from the Mac App Store (requires `mas` login)
  homebrew.masApps = {
    "Bitwarden" = 1352778147;
  };
}
