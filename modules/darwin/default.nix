{ pkgs, ... }: {
  # here go the darwin preferences and config items
  # programs.fish.enable = true;
  programs.zsh.enable = true;
  environment = {
    # shells = with pkgs; [ bash zsh fish ];
    # loginShell = pkgs.fish;
    systemPackages = [ pkgs.coreutils ];
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  system.activationScripts.postUserActivation.text = ''
    # Following line should allow us to avoid a logout/login cycle
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  imports = [
    # Window Manager
    # ./services/wm/kwm.nix
    ./services/wm/yabai.nix
    ./services/wm/skhd.nix
    # ./services/wm/spacebar.nix

    # Homebrew
    ./services/brew.nix

    # Custom Preferences
    ./services/custom_preferences.nix

    # Main Darwin
    ./services/main_darwin.nix

    # database sql
    # ./services/postgresql.nix
  ];

  # backwards compat; don't change
  system.stateVersion = 4;
  ids.uids.nixbld = 300;
}
