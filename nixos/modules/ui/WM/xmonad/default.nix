{ pkgs, ... }: {

  services.libinput.enable = true;
  services.libinput.touchpad.naturalScrolling = true;
  services.libinput.touchpad.disableWhileTyping = true;

  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    extraPackages = hpkgs: [
      hpkgs.xmonad
      hpkgs.xmonad-extras
      hpkgs.xmonad-contrib
    ];
  };

  xdg.portal.config.common.default = "*";

  nixpkgs.overlays = [
    (self: super: {
      mpv = super.mpv.override {
        scripts = [self.mpvScripts.mpvacious];
      };
    })
  ]
  ;

  environment.systemPackages = with pkgs; [
    picom
    xmobar
    haskell-language-server
    dmenu
    (pkgs.rofi.override { plugins = [ pkgs.rofi-emoji ]; })
    xdotool
    maim
    trayer
    dunst
    xss-lock
    betterlockscreen
    i3lock
    feh
    libnotify
    xfce.thunar
    lxappearance
    scrot
    btop
    mpv
  ];

  services.xserver.displayManager.sessionCommands = ''
    # xwallpaper --zoom ~/wallpapers/gruvbox.jpg
    ./.fehbg
    # (Optional, but often helps with environment variables)
    export PATH=$PATH:/run/current-system/sw/bin
  '';

  # Enable xss-lock for managing the screen locker when the session is idle or suspended
  programs.xss-lock.enable = true;
  programs.xss-lock.lockerCommand =
    "${pkgs.betterlockscreen}/bin/betterlockscreen --lock";

  services.picom = {
    enable = true;
    # activeOpacity = 1.0;
    # inactiveOpacity = 0.8;
    backend = "glx";
    fade = true;
    fadeDelta = 5;
    fadeSteps = [ 8.0e-2 8.0e-2 ];
    # shadow = true;
    # shadowOpacity = 0.75;

    # extraConfig = ''
    #   animations = ({
    #     triggers = [ "size" ];
    #     scale-x = {
    #       curve = "cubic-bezier(0.175, 0.885, 0.32, 1.275)";
    #       start = "window-width-before / window-width";
    #       end = 1;
    #       duration = 0.2;
    #     };
    #     scale-y = {
    #       curve = "cubic-bezier(0.175, 0.885, 0.32, 1.275)";
    #       start = "window-height-before / window-height";
    #       end = 1;
    #       duration = 0.2;
    #     };
    #     offset-x = {
    #       curve = "cubic-bezier(0.175, 0.885, 0.32, 1.275)";
    #       start = "window-x-before - window-x";
    #       duration = 0.2;
    #       end = 0;
    #     };
    #     offset-y = {
    #       curve = "cubic-bezier(0.175, 0.885, 0.32, 1.2)";
    #       start = "window-y-before - window-y";
    #       duration = 0.2;
    #       end = 0;
    #     };
    #
    #     shadow-scale-y = "scale-y";
    #     shadow-scale-x = "scale-x";
    #   })
    # '';

    settings = {
      blur = {
        method = "gaussian";
        size = 10;
        deviation = 5.0;
      };
    };

    # opacityRules = [ "85:class_g = 'Code'" "88:class_g = 'discord'" ];

  };

  security.pam.services = { i3lock.enable = true; };
}
