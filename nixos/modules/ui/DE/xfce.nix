{ pkgs, ... }: {
  services = {
    xserver.desktopManager.xfce.enable = true;
    xserver.windowManager.fvwm2.gestures = true;
    libinput.enable = true;
  };

  environment.systemPackages = with pkgs; [
    rofi
    xfce.xfce4-clipman-plugin
    xfce.xfce4-docklike-plugin

    libinput
    libinput-gestures

    wmctrl
    xdotool

    libnotify

    touchegg
  ];

  services.touchegg.enable = true;
}
