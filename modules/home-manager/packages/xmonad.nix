{ pkgs, ... }: {
  home.packages = with pkgs; [
    (pkgs.rofi.override { plugins = [ pkgs.rofi-emoji ]; })
    rofi-obsidian
    dmenu
    xmobar
    # haskell-language-server 
    xdotool
    maim
    trayer
    lxappearance
    #   xss-lock
    #   betterlockscreen
    #   i3lock 
    scrot
    feh
    btop

    bibata-cursors
    gruvbox-dark-icons-gtk
    gruvbox-gtk-theme
    gruvbox-material-gtk-theme
  ];
}
