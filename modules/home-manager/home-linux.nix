{ config, pkgs, ... }:

{
  home.username = "kemalmao";
  home.homeDirectory = "/home/kemalmao";
  home.stateVersion = "23.05";
  programs.home-manager.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  #nixpkgs.overlays = [ ../../overlays/default.nix ];

  imports = [ ./packages.nix ];
}
