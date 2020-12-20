{ config, lib, pkgs, ... }:
 
{
  programs.alacritty = {
    enable = true;
    settings = {
      background_opacity = 0.8;
      window = {
        decorations = "buttonless";
        padding = {
          x = 10;
          y = 10;
        };
      };
      font = {
        normal= {
          family= "Hack Nerd Font Mono";
  };
  };
    };
  };
}
