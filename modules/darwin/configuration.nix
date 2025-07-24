{self, ...}: {

  nixpkgs.config.allowUnfree = true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  # Automatically clean up leftovers after one week
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
  };

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  imports = [
    ./network.nix
    ./system.nix
    ./fonts.nix
    ./packages.nix
    ./launchd.nix
    ./nix-zsh-paths.nix
  ];

}
