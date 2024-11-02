{
  description =
    "Kemalmao nix environment: NixOS, Home Manager, Darwin and Nixvim";
  inputs = {
    # nix derivations
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable"; # unstable channel
    };

    # home manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix darwin
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixified vim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # tree-sitter-rescript
    ts-rescript = {
      url = "github:nkrkv/tree-sitter-rescript";
      flake = false;
    };
  };

  # TODO: for each system configuration. 

  outputs = inputs@{ nixpkgs, home-manager, darwin, nixvim, ... }:
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
        if system != "x86_64-darwin" || "aarch64-darwin" then
          home-manager.lib.homeManagerConfiguration {
            pkgs = pkgs system;
            modules = [
              ./modules/home-manager
              {
                home.username = username;
                home.homeDirectory = "/home/${username}";
              }

              nixvim.homeManagerModules.nixvim
            ];
          }
        else
          home-manager.darwinModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              users.${username}.imports =
                [ ./modules/home-manager nixvim.nixDarwinModules.nixvim ];
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

      # Define Func for Nixvim Standalone
      mkNixvim = system:
        let nixvim' = nixvim.legacyPackages.${system};
        in nixvim'.makeNixvimWithModule {
          pkgs = pkgs system;
          module = ./modules/nixvim/config.nix;
          # You can use `extraSpecialArgs` to pass additional arguments to your module files
          extraSpecialArgs = {
            # inherit (inputs) foo;
          };
        };
    in {
      # darwin & darwin home manager
      darwinConfigurations.${user.name} = mkDarwinConfig user.darwin user.name;

      # linux home manager 
      homeConfigurations.${user.name} = mkHomeConfig user.linux user.name;

      # nixos 
      nixosConfigurations.${user.name} = mkNixosConfig;

      # standalone nixvim 
      nixvim = mkNixvim;
    };
}
