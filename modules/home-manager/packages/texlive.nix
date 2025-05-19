{ pkgs, ... }:
let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive)
      scheme-basic blindtext hyperref etoolbox setspace ragged2e;

  });
in { home.packages = [ tex ]; }
