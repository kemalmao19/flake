{ pkgs, ... }:

{

  # nixpkgs.overlays = [ ../../overlays/default.nix ];
  home.stateVersion = "24.05";
  home.sessionVariables = {
    PAGER = "less";
    CLICLOLOR = 1;
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  imports = [ ./packages.nix ./desktop/pantheon.nix ];

  home.packages = with pkgs; [ ibus-engines.mozc ];

}
