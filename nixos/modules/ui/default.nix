{ pkgs, ... }: {
  # SDDM
  services.displayManager = {
    sddm.enable = false;
    sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  };

  # DM
  imports = [
    # Pantheon 
    # ./DE/pantheon.nix

    # Gnome
    ./DE/gnome.nix

    # Hyprland
    ./WM/hypr
  ];

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    whitesur-gtk-theme
    whitesur-icon-theme
    whitesur-cursors

    # sddm custom dependecy
    # libsForQt5.qt5.qtquickcontrols2
    # libsForQt5.qt5.qtgraphicaleffects
  ];
}
