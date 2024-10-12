{
  description = "Kemalmao minimal flake for Darwin";
  inputs = {
    # called derivations that say how to build software.
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable"; # unstable channel
    };

    # Manages configs links things into your home directory
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix darwin
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # tree-sitter-rescript
    ts-rescript = {
      url = "github:nkrkv/tree-sitter-rescript";
      flake = false;
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, ... }: {
    # darwin & darwin home manager
    darwinConfigurations.kemalmao = darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        system = "x86_64-darwin";
        config = { allowUnfree = true; };
      };
      modules = [
        ./modules/darwin

        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            users.kemal.imports = [ ./modules/home-manager ];
          };
          users.users.kemal.home = "/Users/kemal";
        }
      ];
    };
    # linux home manager 
    homeConfigurations.kemalmao = home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config = { allowUnfree = true; };
      };
      modules = [ ./modules/home-manager/home-linux.nix ];
    };

    # nixos | not tested, you cab try or modif
    nixosConfigurations."x86_64-linux" = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [ ./nixos/configuration.nix ];
    };
  };
}
