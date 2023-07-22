{ config, pkgs, lib, ... }: 
{
  programs.urxvt = {
    enable = true;
    fonts = [
      "xft:Iosevka:size=10"
    ];
    
    extraConfig = {
      shading = 15;
    };

    
  };
}