{ config, ... }: {
  dconf.settings = {
    "io/elementary/desktop/wingpanel" = { use-transparency = true; };

    "com/github/stsdc/monitor/settings" = {
      background-state = false;
      indicator-state = true;
      indicator-network-download-state = true;
      indicator-network-upload-state = false;
    };

    "org/pantheon/desktop/gala/appearance" = {
      button-layout = ":minimize,close";
    };

    "org/pantheon/desktop/gala/behavior" = {
      dynamic-workspaces = true;
      overlay-action =
        "io.elementary.wingpanel --toggle-indicator=app-launcher";
    };

    "org/pantheon/desktop/gala/mask-corners" = { enable = false; };

    "net/launchpad/plank/docks/dock1" = {
      alignment = "center";
      hide-mode = "window-dodge";
      icon-size = 36;
      pinned-only = false;
      position = "bottom";
      theme = "Transparent";
    };

    "io/elementary/terminal/settings" = {
      audible-bell = false;
      background = "rgb(18,18,20)";
      cursor-color = "rgb(255,182,56)";
      follow-last-tab = "true";
      font = "FiraCode Nerd Font Medium 12";
      foreground = "rgb(200,200,200)";
      natural-copy-paste = false;
      palette =
        "rgb(20,20,23):rgb(214,43,43):rgb(65,221,117):rgb(255,182,56):rgb(40,169,255):rgb(230,109,255):rgb(20,229,211):rgb(200,200,200):rgb(67,67,69):rgb(222,86,86):rgb(161,238,187):rgb(255,219,156):rgb(148,212,255):rgb(243,182,255):rgb(161,245,238):rgb(233,233,233)";
      theme = "custom";
      unsafe-paste-alert = false;
    };
  };

  # dotfiles
  home.file = {
    "${config.xdg.configHome}/autostart/monitor-background.desktop".text = ''

      [Desktop Entry]
      Name=Monitor Indicators
      Comment=Monitor Indicators
      Type=Application
      Exec=com.github.stsdc.monitor --start-in-background
      Icon=com.github.stsdc.monitor
      Categories=
      Terminal=false
      NoDisplay=true
      StartupNotify=false'';
  };

}
