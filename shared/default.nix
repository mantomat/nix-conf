{ self, ... }:
{

  imports = [
    ./macos-settings.nix
    ./fonts.nix
    ./packages.nix
    ./login-agents.nix
    ./nix-zsh-paths.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Automatically clean up leftovers after one week
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
    interval = {
      Weekday = 0;
      Hour = 3;
      Minute = 0;
    }; # weekly, Sunday 3am
  };
  nix.optimise.automatic = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
}
