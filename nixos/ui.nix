{ pkgs, ... }: {
  services.displayManager = {
    sddm.enable = true;
    sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  };

  services.xserver.desktopManager = { gnome.enable = true; };
  #EXCULDE  
  environment.gnome.excludePackages = with pkgs; [
    epiphany
    gnome-contacts
    gnome-initial-setup
    geary
  ];

  programs.dconf = {
    enable = true;
    # settings = {
    #   "/org/gnome/desktop/interface" = { show-battery-percentage = true; };
    # };
  };

  environment.systemPackages = with pkgs;
    [ gnome-tweaks ]
    ++ (with gnomeExtensions; [ gsconnect appindicator hide-top-bar dashbar ]);
}
