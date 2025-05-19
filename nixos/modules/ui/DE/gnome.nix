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
  environment.systemPackages = with pkgs; [
    #tools
    rhythmbox
    kooha
  ];

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
  ];
}
