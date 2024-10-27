{ pkgs, ... }: {
  # SDDM
  services.displayManager = {
    sddm.enable = true;
    sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  };

  # DM
  imports = [ ./DE/pantheon.nix ];

  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    catppuccin-gtk
    whitesur-icon-theme
    apple-cursor

    # sddm dependecy
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
