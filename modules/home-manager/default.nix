{ pkgs, ... }:

{

  # nixpkgs.overlays = [ ../../overlays/default.nix ];
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
  home.sessionVariables = {
    PAGER = "less";
    CLICLOLOR = 1;
    EDITOR = "nvim";
  };

  imports = [ ./packages ./desktop ./dotfiles ];

  home.packages = with pkgs; [ ibus-engines.mozc ];

  # Chrome/Fyde OS registering
  # xdg.configFile."systemd/user/cros-garcon.service.d/override.conf".text = ''
  #   [Service]
  #   Environment="PATH=%h/.nix-profile/bin:/usr/local/sbin:/usr/local/bin:/usr/local/games:/usr/sbin:/usr/bin:/usr/games:/sbin:/bin"
  #   Environment="XDG_DATA_DIRS=%h/.nix-profile/share:%h/.local/share:%h/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share"
  # '';
}
