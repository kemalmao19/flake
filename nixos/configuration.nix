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
    # https://github.com/emersion/xdg-desktop-portal-wlr/issues/42
    # Breaks `xdg-open` by causing the same behaviour as opening links from Flatpak
    #xdgOpenUsePortal = true;
  };

  # eenvironment packages
  environment.systemPackages = with pkgs; [
    appimage-run
    xarchiver
    lm_sensors
    hello-unfree
  ];

  # Perform garbage collection weekly to maintain low di/home/kemalmao/.config/fish/config.fish' is in the way of '/nix/store/3yj4yan0lsqsv40zlvgnmp3k9zjzlwkw-home-manager-files/.config/fish/config.fishsk usage
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 2w";
  };
}
