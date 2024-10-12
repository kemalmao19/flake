{ pkgs, ... }: {
  #YABAI Window Manager
  services.yabai = {
    enable = true;
    config = {
      #focus_follows_mouse = "autoraise";
      mouse_follows_focus = "off";
      window_placement = "second_child";
      window_opacity = "off";
      window_opacity_duration = "0.0";
      window_border = "off";
      window_border_placement = "inset";
      window_border_width = 4;
      window_border_radius = 30;
      active_window_border_topmost = "off";
      window_topmost = "on";
      window_shadow = "float";
      active_window_border_color = "0xff5c7e81";
      normal_window_border_color = "0xff505050";
      insert_window_border_color = "0xffd75f5f";
      active_window_opacity = "1.0";
      normal_window_opacity = "1.0";
      split_ratio = "0.50";
      auto_balance = "on";
      mouse_modifier = "fn";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      mouse_drop_action = "swap";
      layout = "bsp";
      top_padding = 15;
      bottom_padding = 15;
      left_padding = 15;
      right_padding = 15;
      window_gap = 8;
    };
    extraConfig = ''
      yabai -m rule --add app='System Preferences' manage=off
      yabai -m query --windows | jq 'map(select(.app == "zoom.us"))'
    '';
    # enableScriptingAddition = true;
  };
}
