{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "FiraCode Nerd Font Mono";
        size = 10;
      };
      window = {
        dimensions = {
          lines = 25;
          columns = 80;
        };
        padding = {
          x = 10;
          y = 0;
        };
        startup_mode = "windowed";
      };
      colors = {
        primary = {
          background = "#303446";
          foreground = "#c6d0f5";
          dim_foreground = "#838ba7";
          bright_foreground = "#c6d0f5";
        };
        cursor = {
          text = "#303446";
          cursor = "#f2d5cf";
        };
        vi_mode_cursor = {
          text = "#303446";
          cursor = "#babbf1";
        };
        search = {
          matches = {
            foreground = "#303446";
            background = "#a5adce";
          };
          focused_match = {
            foreground = "#303446";
            background = "#a6d189";
          };
        };
        footer_bar = {
          foreground = "#303446";
          background = "#a5adce";
        };
        hints = {
          start = {
            foreground = "#303446";
            background = "#e5c890";
          };
          end = {
            foreground = "#303446";
            background = "#a5adce";
          };
        };
        selection = {
          text = "#303446";
          background = "#f2d5cf";
        };
        normal = {
          black = "#51576d";
          red = "#e78284";
          green = "#a6d189";
          yellow = "#e5c890";
          blue = "#8caaee";
          magenta = "#f4b8e4";
          cyan = "#81c8be";
          white = "#b5bfe2";
        };
        bright = {
          black = "#626880";
          red = "#e78284";
          green = "#a6d189";
          yellow = "#e5c890";
          blue = "#8caaee";
          magenta = "#f4b8e4";
          cyan = "#81c8be";
          white = "#a5adce";
        };
      };
    };
  };
}
