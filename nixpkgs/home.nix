{ config, pkgs, ... }:

{
  home.username = "kemal";
  home.homeDirectory = "/home/kemal";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  
  imports = [
    ./packages.nix
    ./shell.nix
    # ./terminal.nix
    # ./alacritty.nix
    ./starship_symbol.nix
    ./git.nix
    # ./gtk.nix
    ./python.nix
    # ./config.nix
  ];
}
