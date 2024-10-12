{ pkgs, ... }: {
  # system.keyboard.enableKeyMapping = true;
  # system.keyboard.remapCapsLockToEscape = true;
  # fonts.fontDir.enable = true; # DANGER 2024 no longer need 
  fonts.packages = [
    (pkgs.nerdfonts.override {
      fonts = [
        "Meslo"
        "FiraCode"
        "Hack"
      ];
    })
  ];

  services.nix-daemon.enable = true;
  system.defaults = {
    finder.AppleShowAllExtensions = true;
    finder._FXShowPosixPathInTitle = true;
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.2;
      expose-animation-duration = 0.2;
      tilesize = 24;
      launchanim = false;
      static-only = false;
      showhidden = true;
      show-recents = false;
      show-process-indicators = true;
      orientation = "bottom";
      mru-spaces = false;
      # mouse in top right corner will start screensaver
      wvous-tr-corner = 5;
      wvous-br-corner = 4;
    };
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.InitialKeyRepeat = 14;
    NSGlobalDomain.KeyRepeat = 1;
  };
}
