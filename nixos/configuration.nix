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
  xdg.portal.enable = true;

  environment.systemPackages = with pkgs; [
    appimage-run
    xarchiver
    # CPU autofreq
    # auto-cpufreq
  ];

}
