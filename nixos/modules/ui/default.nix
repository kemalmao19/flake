{ pkgs, ... }: {
  # SDDM
  services.displayManager = {
    ly.enable = true;
    # sddm.enable = true;
    # sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  };

  # DM
  imports = [
    # Pantheon 
    # ./DE/pantheon.nix

    # Gnome
    #./DE/gnome.nix

    # xfce
    # ./DE/xfce.nix

    #openbox
    #./WM/openbox

    # Hyprland
    #./WM/hypr

    # xmonad
    ./WM/xmonad
    
  ];

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    #catppuccin-cursors.mochaPeach
    bibata-cursors
    gruvbox-dark-icons-gtk
    gruvbox-gtk-theme
    gruvbox-material-gtk-theme

    # sddm custom dependecy
    # libsForQt5.qt5.qtquickcontrols2
    # libsForQt5.qt5.qtgraphicaleffects
  ];
}
