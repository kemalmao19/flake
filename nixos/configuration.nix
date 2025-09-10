{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ./modules ];

  system.stateVersion = "25.05";

  programs.fish.enable = true;

  # flake
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable the X11 windowing system
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
  };

  # flatpak 
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    # https://github.com/emersion/xdg-desktop-portal-wlr/issues/42
    # Breaks `xdg-open` by causing the same behaviour as opening links from Flatpak
    #xdgOpenUsePortal = true;
  };

  # eenvironment packages
  environment.systemPackages = with pkgs; [
    appimage-run
    xarchiver
    lm_sensors
    gparted
    wshowkeys
    # hello-unfree #check for unfree apps
  ];

  # Perform garbage collection weekly to maintain low di/home/kemalmao/.config/fish/config.fish' is in the way of '/nix/store/3yj4yan0lsqsv40zlvgnmp3k9zjzlwkw-home-manager-files/.config/fish/config.fishsk usage
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  services.udisks2.enable = true;

  # virtualisation.docker = {
  #   enable = true;
  #   # Set up resource limits
  #   daemon.settings = { experimental = true; };
  # };
}
