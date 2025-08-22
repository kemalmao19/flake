{ pkgs, ... }: {
  gtk = {
    enable = true;
    cursorTheme.name = "catppuccin-mocha-peach";
    cursorTheme.package = pkgs.catppuccin-cursors.mochaPeach;
    iconTheme.name = "Papirus-Dark";
    iconTheme.package = pkgs.catppuccin-papirus-folders;
    theme.name = "catppuccin-mocha-peach-standard";
    theme.package = pkgs.catppuccin-gtk.override {
      accents = [ "peach" ];
      size = "standard";
      variant = "mocha";
    };

    font.name = "Caskaydia Nerd Font";
    font.size = 10;

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
  imports = [ ./gnome.nix ];
  home.sessionVariables.GTK_THEME = "catppuccin-mocha-peach-standard";
}
