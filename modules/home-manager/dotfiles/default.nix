{ config, lib, ... }: {
  # dotfiles
  home.file.".inputrc".source = ./inputrc;
  home.file.".config/kitty/".source = ./config/kitty;
  home.file.".config/fastfetch/".source = ./config/fastfetch;
  home.file.".config/zellij/".source = ./config/zellij;
  home.file.".config/zathura/".source = ./config/zathura;

  # hyprland config
  home.file.".config/hypr/".source = ./config/hyprland/hypr;
  # home.file.".config/hypr/".source = ./config/hyprland/hypr-caelestia;
  home.file.".config/waybar/".source = ./config/hyprland/waybar;
  home.file.".config/rofi/".source = ./config/hyprland/rofi;
  home.file.".config/swaync/".source = ./config/hyprland/swaync;

  # home.file.".config/colors.conf".source =
  #   lib.mkForce (config.lib.file.mkOutOfStoreSymlink ./config/colors.conf);
}
