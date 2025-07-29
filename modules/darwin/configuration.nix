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

  # TODO: system activation scripts
  # ActivationScripts cannot be created arbitrarily. There are a limited sets
  # of them that can be used by us. Others are dedicated to the internals.
  # And postActivation is one of them.
  # See https://github.com/nix-darwin/nix-darwin/blob/e04a388232d9a6ba56967ce5b53a8a6f713cdfcf/modules/system/activation-scripts.nix
  # I will think about it when nix-darwin will have implemented system.userActivationScripts, as they are run as root now (no bueno).

  # system.activationScripts.postActivation.text = ''
  #   echo "test" > /Users/mantomat/scripttest
  # '';

}
