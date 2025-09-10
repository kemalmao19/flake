{ config, pkgs, ... }:

let
  colorFile = "${config.xdg.stateHome}/caelestia/colors.conf";

  caelestiaWatcher = pkgs.writeShellScriptBin "caelestia-watcher" ''
    #!/usr/bin/env bash
    COLOR_FILE="${colorFile}"
    mkdir -p "$(dirname "$COLOR_FILE")"
    last=""

    strip_ansi() {
      sed 's/\x1b\[[0-9;]*m//g'
    }

    update_colors() {
      primary=$(caelestia scheme get | sed -n 's/.*primary: //p' | strip_ansi)
      caelestiaPrimary="$primary"ff

      if [[ "$primary" != "$last" && -n "$primary" ]]; then
        echo "\$caelestiaPrimary = rgba($caelestiaPrimary)" > "$COLOR_FILE"
        hyprctl keyword "\$caelestiaPrimary" "rgba($caelestiaPrimary)" >/dev/null 2>&1
        echo "[Watcher] Updated primary to $primary"
        last="$primary"
      fi
    }

    while true; do
      update_colors
      sleep 30   # jangan lupa sleep, biar CPU nggak 100%
    done
  '';
in {
  home.file.".config/colors.conf".source =
    config.lib.file.mkOutOfStoreSymlink colorFile;

  home.packages = [ caelestiaWatcher ];

  systemd.user.services.caelestia-watcher = {
    Unit = {
      Description = "Sync Caelestia colors with Hyprland";
      After = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${caelestiaWatcher}/bin/caelestia-watcher";
      Restart = "always";
    };
    Install = { WantedBy = [ "default.target" ]; };
  };
}

