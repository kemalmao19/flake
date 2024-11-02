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
    ./DE/gnome.nix
  ];

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    catppuccin-gtk
    yaru-theme
    whitesur-icon-theme
    apple-cursor

    # sddm dependecy
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects

    # tools
    dconf-editor
  ];
}
