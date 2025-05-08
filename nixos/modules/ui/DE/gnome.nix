{ pkgs, ... }: {
  # Gnome
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;

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
      blur-my-shell
      pop-shell
      gsconnect
      appindicator
      hide-top-bar
      space-bar
      emoji-copy
    ]);

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
  ];
}
