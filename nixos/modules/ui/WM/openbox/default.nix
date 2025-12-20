{ pkgs, ... }: {
  services.xserver.windowManager.openbox.enable = true;

  services.libinput.enable = true;
  services.libinput.touchpad.naturalScrolling = true;

  environment.systemPackages = with pkgs; [
    # Core WM
    openbox
    obconf
    nitrogen
    picom
    rofi

    # Panel
    polybar

    # notif
    libnotify
    dunst

    # Appearance
    lxappearance

    # Utilities
    networkmanagerapplet
    volumeicon
    xfce.thunar

    #terminal
    rxvt-unicode-emoji

    # Input
    libinput
    libinput-gestures
    wmctrl
    xdotool

    # misc
    scrot
    betterlockscreen
  ];

  networking.networkmanager.enable = true;
}
