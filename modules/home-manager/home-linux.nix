{ pkgs, config, ... }:

{
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  #nixpkgs.overlays = [ ../../overlays/default.nix ];

  imports = [ ./packages.nix ./desktop/pantheon.nix ];

  home.packages = with pkgs; [ ibus-engines.mozc ];

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
