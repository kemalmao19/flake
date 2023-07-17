{ config, pkgs, ... }:

{
  program.kitty = {
    enable = true;
    font.names = "Iosevka";
    font.size = "10";
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+f>2" = "set_font_size 20";
    };
    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;
    };
    shellIntegration.enableZshIntegration = true;
    theme = "Space Gray Eighties";
  };

}
