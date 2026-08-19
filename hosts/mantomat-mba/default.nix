{ ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";

  imports = [
    ../../modules/configuration.nix
    ./networking.nix
  ];
}
