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

  outputs = inputs@{ nixpkgs, home-manager, darwin, ... }:
    let
      # Define user 
      user = {
        name = "kemalmao";
        linux = "x86_64-linux";
        darwin = "x86_64-darwin";
      };
      # Define pkgs 
      pkgs = system:
        import nixpkgs {
          inherit system;
          config = { allowUnfree = true; };
        };

      # Define Func for Home Manager configuration
      mkHomeConfig = system: username:
        if system == "x86_64-linux" || "aarch64-linux" || "i686-linux" then
          home-manager.lib.homeManagerConfiguration {
            pkgs = pkgs system;
            modules = [
              ./modules/home-manager/home-linux.nix
              {
                home.username = username;
                home.homeDirectory = "/home/${username}";
              }
            ];
          }
        else
          home-manager.darwinModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.${username}.imports =
                [ ./modules/home-manager/home-darwin.nix ];
            };
            users.users.${username}.home = "/Users/${username}";
          };

      # Define Func for NixOS configuration
      mkNixosConfig = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [ ./nixos/configuration.nix ];
      };

      # Define Func for Darwin configuration
      mkDarwinConfig = system: username:
        darwin.lib.darwinSystem {
          lib = nixpkgs.lib;
          pkgs = pkgs system;
          modules = [ ./modules/darwin (mkHomeConfig system username) ];
        };
    in {
      # darwin & darwin home manager
      darwinConfigurations.${user.name} = mkDarwinConfig user.darwin user.name;

      # linux home manager 
      homeConfigurations.${user.name} = mkHomeConfig user.linux user.name;

      # nixos 
      nixosConfigurations.kemalmao = mkNixosConfig;
    };
}
