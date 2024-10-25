{ pkgs, ... }: {
  # SDDM
  services.displayManager = {
    sddm.enable = true;
    sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  };

  # gnome
  imports = [ ./gnome.nix ];
}
