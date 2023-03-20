{ config, pkgs, ... }:
{
  imports = [
    ./packages.nix
    ./shell.nix
    ./git.nix
    ./terminal.nix
    ./config.nix
  ];

   home.username = "kemal";
   home.homeDirectory = "/home/kemal";
   home.stateVersion = "21.11";
   programs.home-manager.enable = true;
   programs.direnv.enable = true;
   programs.direnv.nix-direnv.enable = true;
  # programs.neovim = {
#	enable = true;
#	plugins = {
#		with pkgs.vimPlugins; [
#		  yankring
#		  vim-nix
#		  { plugin = vim-startify;
#		    config = "let g:startify_change_to_vcs_root = 0";}
#			]};
}
