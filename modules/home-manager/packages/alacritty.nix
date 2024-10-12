{pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "MesloLGS Nerd Font Mono";
        size = 12;
      };
      window = {
        dimensions = {
          lines = 25;
          columns = 80;
        };
        padding = {
          x = 10;
          y = 10;
        };
        background_opacity = 0.5;
        # startup_mode = "windowed";
      };
    };
  };
}