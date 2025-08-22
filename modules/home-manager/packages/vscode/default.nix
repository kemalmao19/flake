{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default.userSettings = import ./userSettings.nix;
    # extensions = import ./extensions.nix { inherit pkgs; };
  };

}
