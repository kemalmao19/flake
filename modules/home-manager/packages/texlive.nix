{ pkgs, ... }:
let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-basic blindtext hyperref etoolbox;
  });
in { home.packages = [ tex ]; }
