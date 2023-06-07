{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { self, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations = {
        kemal = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ({ config, lig, pkgs, ... }:{
              home.stateVersion = "22.11";
              home.username = "kemal";
              home.homeDirectory = "/home/kemal";
              # allowUnfree = true;
              imports = [
                ./nixpkgs/home.nix
              ];
            })
          ];
        };
      };
    };
}

