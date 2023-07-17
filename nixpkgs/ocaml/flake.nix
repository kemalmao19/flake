{
  descriptions = " A nix-flake base Ocaml develpment environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {

    self, nixpkgs, flake-utils

    }:

    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        devShell.default = pkgs.mkShell {
          packages = with pkgs; [ opam ];

          shellHook = with pkgs; ''
            ${opam}/bin/opam --version
          '';
        };
      });
}
