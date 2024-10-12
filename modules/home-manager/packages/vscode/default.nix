{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    userSettings = import ./userSettings.nix;
    extensions = import ./extensions.nix { inherit pkgs; };
  };

}
