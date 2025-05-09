{ pkgs, ... }:

{

  # nixpkgs.overlays = [ ../../overlays/default.nix ];
  home.stateVersion = "24.05";
  home.sessionVariables = {
    PAGER = "less";
    CLICLOLOR = 1;
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  imports = [ ./packages.nix ./desktop/pantheon.nix ];

  home.packages = with pkgs; [ ibus-engines.mozc ];

  # Chrome/Fyde OS registering
  xdg.configFile."systemd/user/cros-garcon.service.d/override.conf".text = ''
    [Service]
    Environment="PATH=%h/.nix-profile/bin:/usr/local/sbin:/usr/local/bin:/usr/local/games:/usr/sbin:/usr/bin:/usr/games:/sbin:/bin"
    Environment="XDG_DATA_DIRS=%h/.nix-profile/share:%h/.local/share:%h/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share"
  '';
}
