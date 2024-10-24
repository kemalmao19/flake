{ pkgs, ... }: {
  services.displayManager = {
    sddm.enable = true;
    sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  };

  services.xserver.desktopManager = { gnome.enable = true; };
  programs.dconf.enable = true;

  #EXCULDE  
  environment.gnome.excludePackages = with pkgs; [
    epiphany
    gnome-tour
    gnome-contacts
    gnome-initial-setup
    geary
  ];

  # EXTENSIONS
  environment.systemPackages = with pkgs;
    [
      gnome-tweaks
      whitesur-icon-theme
      apple-cursor

      # sddm dependecy
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtgraphicaleffects

    ] ++ (with gnomeExtensions; [
      gsconnect
      appindicator
      hide-top-bar
      dashbar
      blur-my-shell
    ]);
}
