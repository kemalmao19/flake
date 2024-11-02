{ pkgs, ... }: {
  # services
  services = {
    pantheon.apps.enable = true;
    xserver = {
      enable = true;
      desktopManager = {
        pantheon = {
          enable = true;
          extraWingpanelIndicators = with pkgs; [
            monitor
            wingpanel-indicator-ayatana
          ];
        };
      };
    };
  };

  # programs
  programs = { gnome-disks.enable = true; };

  # environment 
  environment = {
    # Exclude the elementary apps I don't use
    pantheon.excludePackages = with pkgs.pantheon; [ epiphany ];

    # App indicator
    # - https://discourse.nixos.org/t/anyone-with-pantheon-de/28422
    # - https://github.com/NixOS/nixpkgs/issues/144045#issuecomment-992487775
    pathsToLink = [ "/libexec" ];

    # Add additional apps and include Yaru for syntax highlighting
    systemPackages = with pkgs; [
      pantheon-tweaks # tweaks for elementary OS
      appeditor # elementary OS menu editor
      indicator-application-gtk3 # App Indicator
      pantheon.sideload # elementary OS Flatpak installer
    ];
  };

  # App indicator
  # - https://github.com/NixOS/nixpkgs/issues/144045#issuecomment-992487775
  systemd.user.services.indicatorapp = {
    description = "indicator-application-gtk3";
    wantedBy = [ "graphical-session.target" ];
    partOf = [ "graphical-session.target" ];
    serviceConfig = {
      ExecStart =
        "${pkgs.indicator-application-gtk3}/libexec/indicator-application/indicator-application-service";
    };
  };
}
