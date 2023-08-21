{ config, pkgs, ... }:
{
  catppucinn = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Compact-Pink-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "pink" ];
        size = "compact";
        tweaks = [ "rimless" ];
        variant = "macchiato";
      };
    };
  };

    gruvboxx = {
      enable = true;
      theme = {
        name = "gruvbox-gtk";
        package = pkgs.gruvbox-gtk-theme;
      iconTheme = {
        name = "gruvbox-icon";
        package = pkgs.gruvbox-dark-icons-gtk;
        };
      };
    }; 
}