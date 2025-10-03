{pkgs,...}:{
  services = {
    xserver.windowManager.fvwm2.gestures = true;
    libinput.enable = true;
  };
  services.xserver.desktopManager.xfce.enable = true;
  environment.systemPackages = with pkgs; [
    xfce.xfce4-clipman-plugin
    xfce.xfce4-whiskermenu-plugin

    libinput
    libinput-gestures
    wmctrl
    xdotool
  ];
}
