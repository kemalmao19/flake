{ pkgs, ... }: {
  # Gnome
  services.xserver.desktopManager = { gnome.enable = true; };

  #EXCULDE  
  environment.gnome.excludePackages = with pkgs; [
    epiphany
    gnome-tour
    gnome-contacts
    gnome-initial-setup
    gnome-music
    geary
  ];

  # EXTENSIONS
  environment.systemPackages = with pkgs;
    [
      #tools
      gnome-tweaks
      rhythmbox
      pop-launcher

    ] ++ (with gnomeExtensions; [
      pop-shell
      gsconnect
      appindicator
      hide-top-bar
      dash-to-panel
      space-bar
    ]);

}
