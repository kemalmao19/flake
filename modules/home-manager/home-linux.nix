{ pkgs, ... }:

{
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  #nixpkgs.overlays = [ ../../overlays/default.nix ];

  imports = [ ./packages.nix ./desktop/pantheon.nix ];

  home.packages = with pkgs; [ ibus-engines.mozc ];

}
