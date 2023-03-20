{ pkgs, ... }:
{
  programs.alacritty.enable = true;
  programs.alacritty.package = pkgs.alacritty;
  programs.alacritty.settings = {
    window = {
      dimensions = {
        columns = 0;
        lines = 0;
      };
      padding = {
        x = 0;
        y = 0;
      };
      background_opacity = 0.95;
      startup_mode = ''Windowed'';
    };
  };
}
