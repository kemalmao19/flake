{ pkgs, ... }: {
  programs.hyprland = {
    enable = true; # enable Hyprland
  };

  environment.systemPackages = with pkgs; [

    kitty # required for the default Hyprland config

    # Bar
    waybar
    # pkgs.eww

    # notif
    dunst
    libnotify

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
    wl-clipboard # xclip alternative
    hyprshot # ss using mouse

    # theme
    catppuccin-papirus-folders

    # lock
    hyprlock
  ];

  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
