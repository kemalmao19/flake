{ pkgs }:

let
  nixosWallpaper = {
    url =
      "https://raw.githubusercontent.com/NixOS/nixos-artwork/f07707cecfd89bc1459d5dad76a3a4c5315efba1/wallpapers/nix-wallpaper-nineish-dark-gray.png";
    sha256 = "07zl1dlxqh9dav9pibnhr2x1llywwnyphmzcdqaby7dz5js184ly";
  };

  unohanaWallpaper = {
    url = "https://w.wallhaven.cc/full/p9/wallhaven-p98go3.jpg";
    sha256 = "1s1gbchvxl056zbj4g53wri38zrfsrnpd3l8pc9kv560p5hqikf3";
  };

  fetchImage = url: sha256:
    pkgs.fetchurl {
      url = url;
      sha256 = sha256;
    };

  image = fetchImage unohanaWallpaper.url unohanaWallpaper.sha256;
in pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
    sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm Background.jpg
    cp -r ${image} $out/Background.jpg
  '';
}
