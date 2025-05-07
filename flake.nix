{
  description = "mntmtt's system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";

    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

outputs = inputs@{ self, nix-darwin, home-manager, nixpkgs }: {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#mntmtt-mba
    darwinConfigurations."mntmtt-mba" = nix-darwin.lib.darwinSystem {
      modules = [
        ./modules/darwin/configuration.nix
      ];

      specialArgs = { inherit self; };
    };
  };
}
