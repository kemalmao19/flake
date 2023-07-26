{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    neofetch
    # wget 
    #firefox 
    #simplenote 
    ranger
    # appimage-run
    # zip 
    # unzip 
    bat
    bottom
    exa
    # tmux
    blackbox-terminal
    nixfmt
    trash-cli
    chromium
    vscodium
    simplescreenrecorder
  ];
}
