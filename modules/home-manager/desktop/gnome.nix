{ pkgs, ... }: {

  home.packages = with pkgs;
    [ gnome-tweaks pop-launcher ] ++ (with gnomeExtensions; [
      caffeine
      pop-shell
      emoji-copy
      appindicator
      gsconnect
      blur-my-shell
      fuzzy-clock-3
      freon
    ]);

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "pop-shell@system76.com"
        "emoji-copy@felipeftn"
        "appindicatorsupport@rgcjonas.gmail.com"
        "gsconnect@andyholmes.github.io"
        "blur-my-shell@aunetx"
        "caffeine@patapon.info"
        "FuzzyClock@fire-man-x"
        "freon@UshakovVasilii_Github.yahoo.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
      ];
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = "catppuccin-mocha-peach-standard";
    };
    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/kemalmao/.config/hypr/wallpaper.jpg";
      picture-uri-dark = "file:///home/kemalmao/.config/hypr/wallpaper.jpg";
    };
    "org/gnome/desktop/applications/terminal" = { exec = "kitty"; };
  };
}
