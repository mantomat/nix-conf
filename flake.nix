{
  description = "mantomat's system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";

    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nix-darwin,
      nixpkgs,
      flake-utils,
    }:
    {
      darwinConfigurations = {
        "mantomat-mba" = nix-darwin.lib.darwinSystem {
          modules = [
            ./hosts/mantomat-mba
          ];
          specialArgs = { inherit self; };
        };
      };
    }
    // flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        formatter = pkgs.nixfmt-tree;

        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.nil
            pkgs.nixd
          ];
        };
      }
    );
}
