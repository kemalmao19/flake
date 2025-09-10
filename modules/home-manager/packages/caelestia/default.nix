{ pkgs, ... }: {
  programs.caelestia = let scale = 0.8;
  in {
    enable = true;
    # https://github.com/caelestia-dots/shell?tab=readme-ov-file#configuring
    settings = {
      appearance = {
        font.size.scale = scale;
        padding.scale = scale - 0.2;
        rounding.scale = scale;
        spacing.scale = scale;
      };
      bar.status.showAudio = true;
      bar.workspaces.shown = 3;
      general.apps.terminal = [ "kitty" ];
      launcher.maxShown = 6;
      launcher.showOnHover = true;
      paths.wallpaperDir = "~/Pictures/wallpaper";
    };
    cli = {
      # https://github.com/caelestia-dots/cli?tab=readme-ov-file#configuring
      enable = true; # Also add caelestia-cli to path
      settings = { theme.enableGtk = true; };
    };
  };
  home.packages = with pkgs; [ pavucontrol ];
  # imports = [ ./watcher.nix ];
}
