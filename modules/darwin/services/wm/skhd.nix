{pkgs, ... }: {
    services.skhd = {
      enable = true;
      package = pkgs.skhd;
      skhdConfig = ''
      # toggle window properties
      cmd + ctrl - o : yabai -m window --toggle zoom-fullscreen
      cmd + ctrl - f : yabai -m window --toggle float

      # move focused window
      cmd + ctrl - h : yabai -m window --warp west
      cmd + ctrl - j : yabai -m window --warp south
      cmd + ctrl - k : yabai -m window --warp north
      cmd + ctrl - l : yabai -m window --warp east
    
      # resize
      cmd + ctrl + shift - space : yabai -m space --balance
      cmd + ctrl + shift - j : yabai -m window --resize top:0:100 ; \
                               yabai -m window --resize bottom:0:100
      cmd + ctrl + shift - k : yabai -m window --resize bottom:0:-100 ; \
                               yabai -m window --resize top:0:-100
      cmd + ctrl + shift - h : yabai -m window --resize left:-250:0 ; \
                               yabai -m window --resize right:-250:0
      cmd + ctrl + shift - l : yabai -m window --resize right:250:0 ; \
                               yabai -m window --resize left:250:0
    
      # move to display
      cmd + alt + ctrl - right : yabai -m window --display next
      cmd + alt + ctrl - left  : yabai -m window --display prev

      # fix accidental three-column layout, revert to BSP
      # https://github.com/koekeishiya/yabai/issues/658
      cmd + ctrl - p : yabai -m window --toggle split
    '';
  };
}