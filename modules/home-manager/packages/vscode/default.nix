{ pkgs, lib, config, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    # profiles.default.userSettings = import ./userSettings.nix;

    # extensions = import ./extensions.nix { inherit pkgs; };
  };

  home.file.".config/Code/User/settings.json".source = lib.mkForce
    (config.lib.file.mkOutOfStoreSymlink (builtins.toJSON ./userSettings.nix));

}
