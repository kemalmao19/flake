{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    imports = [ ./config/plugins ];
  };

  imports = [
    ./config/core # core settings
  ];
}
