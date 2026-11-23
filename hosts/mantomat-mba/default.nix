{ ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";

  imports = [
    ../../shared
    ./networking.nix
    ./backup.nix
  ];

  system.primaryUser = "mantomat";

  # Preserve the compatibility baseline for this installation.
  # See darwin-rebuild changelog before changing it.
  system.stateVersion = 6;
}
