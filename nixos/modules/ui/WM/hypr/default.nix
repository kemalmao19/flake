{ pkgs, ... }: {
  programs.hyprland = {
    enable = true; # enable Hyprland
  };

  environment.systemPackages = with pkgs; [

    kitty # required for the default Hyprland config

    # Bar
    waybar

    # notification
    # dunst
    # libnotify
    inotify-tools
    swaynotificationcenter # css styling

    # wallpaper 
    swww

    # launcher
    rofi-wayland

    #network manager
    networkmanagerapplet

    # brightness
    brightnessctl

    # screenshot
    grim # ss utility
    slurp # select utility
    hyprshot # ss using mouse

    wl-clipboard # wayland clipboard
    cliphist

    # lock
    hyprlock

    # polkit
    hyprpolkitagent

    # idle
    hypridle

    # gtk look
    nwg-look
  ];

  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
