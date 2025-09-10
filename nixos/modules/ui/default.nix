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

    # i3
    # ./WM/i3
  ];

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs;
    [
      catppuccin-cursors.mochaPeach

      # sddm custom dependecy
      # libsForQt5.qt5.qtquickcontrols2
      # libsForQt5.qt5.qtgraphicaleffects
    ];
}
