{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "alacritty-wrapped";
  dontUnpack = true;

  buildInputs = with pkgs; [ alacritty libglvnd mesa ];

  installPhase = ''
    mkdir -p $out/bin
    makeWrapper ${pkgs.alacritty}/bin/alacritty $out/bin/alacritty \
      --set LD_LIBRARY_PATH "${pkgs.libglvnd}/lib:${pkgs.mesa.drivers}/lib"
  '';

  nativeBuildInputs = [ pkgs.makeWrapper   ];
}
