{
  programs.nixvim = {
    enable = true;
    imports = [ ./config/plugins ];
  };

  imports = [
    ./config/core # core settings
  ];
}
