{ pkgs, ... }:

{
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  #nixpkgs.overlays = [ ../../overlays/default.nix ];

  imports = [ ./packages.nix ];

  home.packages = with pkgs; [ ibus-engines.mozc ];

  home.file.".config/gtk-3.0/".source = ./dotfiles/config/gtk-3.0;
}
