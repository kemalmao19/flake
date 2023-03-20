{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";

    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = {self, home-manager, ...}@inputs:
    let
      system = "x86_64-linux";
      # https://search.nixos.org/ <-- mencari packages apa saja yang
      # tersedia di nix;
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations = {
        kemal = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [
            ({config, lig, pkgs, ...}:{
              home.stateVersion = "22.11";
              home.username = "kemal";
              home.homeDirectory = "/home/kemal";
              #allowUnfree = true;
	      
              imports = [
                ./nixpkgs/packages.nix
                ./nixpkgs/shell.nix
                ./nixpkgs/git.nix
                ./nixpkgs/terminal.nix
		##./nixpkgs/config.nix
  ];
		})
          ];
        };
      };
    };
}
