{ pkgs, ... }: {
  # SDDM
  services.displayManager = {
    sddm.enable = true;
    sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  };

  # DM
  imports = [
    # Pantheon 
    # ./DE/pantheon.nix

    # Gnome
    #./DE/gnome.nix

   # xfce
  ./DE/xfce.nix

    # Hyprland
    #./WM/hypr

    # i3
    # ./WM/i3
  ];

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs;
    [
      #catppuccin-cursors.mochaPeach
      papirus-icon-theme
      bibata-cursors

      # sddm custom dependecy
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtgraphicaleffects
    ];
}
