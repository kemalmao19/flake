
{ config, pkgs, ... }:
{
	programs.fish.enable = true;
	programs.fish.plugins = [
	 { 
		name = "z";
		src = pkgs.fetchFromGitHub {
		 owner = "jethrokuan";
		 repo = "z";
		 rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
		 sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";};
		}

  # oh-my-fish plugins are stored in their own repositories, which
  # makes them simple to import into home-manager.
	{ 
		name = "fasd";
		src = pkgs.fetchFromGitHub {
		 owner = "oh-my-fish";
		 repo = "plugin-fasd";
		 rev = "38a5b6b6011106092009549e52249c6d6f501fba";
		 sha256 = "06v37hqy5yrv5a6ssd1p3cjd9y3hnp19d3ab7dag56fs1qmgyhbs";};
		}
		];
	programs.fish.shellAliases = {
		g = "git";
		"..." = "cd ../..";
		"bld" = "nix build .#homeConfigurations.kemal.activationPackage";
		"sw" = "./result/activate";
		"cfg"="vim flake.nix";	
		"clc"="nix-collect-garbage -d"; };
}

