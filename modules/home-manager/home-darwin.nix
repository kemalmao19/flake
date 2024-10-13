{ ... }: {
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "23.05";
  home.sessionVariables = {
    PAGER = "less";
    CLICLOLOR = 1;
    EDITOR = "nvim";
  };

  nixpkgs.overlays = [ ../../overlays/default.nix ];

  imports = [ ./packages.nix ];
}
