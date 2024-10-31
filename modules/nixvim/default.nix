{
  programs.nixvim = {
    enable = true;
    imports = [ ./config.nix ];
  };
}
