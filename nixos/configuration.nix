{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ./modules ];

  system.stateVersion = "24.05";

  # flake
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable the X11 windowing system
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
  };

  # shell
  programs.fish.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # https://github.com/emersion/xdg-desktop-portal-wlr/issues/42
    # Breaks `xdg-open` by causing the same behaviour as opening links from Flatpak
    #xdgOpenUsePortal = true;
  };

  environment.systemPackages = with pkgs; [ appimage-run xarchiver ];

  # Perform garbage collection weekly to maintain low disk usage
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 2w";
  };
}
