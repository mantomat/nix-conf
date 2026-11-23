{ ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";

  imports = [
    ../../shared
    ./networking.nix
    ./backup.nix
  ];

}
