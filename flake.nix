{
  description = "mantomat's system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";

    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

outputs = inputs@{ self, nix-darwin, nixpkgs }:
  # Build darwin flake using:
  # $ darwin-rebuild build --flake .#mantomat
  let hostname = "mantomat";
  in {
    darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
      modules = [
        ./modules/configuration.nix
      ];
      specialArgs = { inherit self; };
    };
  };
}
