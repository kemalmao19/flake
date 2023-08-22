{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    # Fun
    neofetch
    ranger

    # File
    appimage-run
    # zip 
    # unzip 

    # shell
    bat
    bottom
    exa
    nixfmt
    trash-cli
    cava
    blackbox-terminal

    # dev
    vscodium
    

  ];
}
