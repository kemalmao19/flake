{
  programs.caelestia.cli.enable = true;
  programs.caelestia = {
    enable = true;
    # https://github.com/caelestia-dots/shell?tab=readme-ov-file#configuring
    settings = {
      font.size.scale = 0.9;
      bar.status = { showBattery = true; };
      paths.wallpaperDir = "~/Pictures/wallpaper";
    };
  };
}
