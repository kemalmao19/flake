{ config, pkgs, ... }:

{
  home.username = "kemalmao";
  home.homeDirectory = "/home/kemalmao";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  imports = [
    ./packages.nix
    ./shell.nix
    ./alacritty.nix
    ./starship_symbol.nix
    ./git.nix
    #./config.nix
  ];
}
