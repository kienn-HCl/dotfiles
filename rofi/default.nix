{
  pkgs,
  config,
  lib,
  ...
}:
{
  home.packages = [ pkgs.rofi ];
  xdg.configFile."rofi".source = ./rofi;
}
