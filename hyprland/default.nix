{
  pkgs,
  config,
  lib,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = false;
    package = config.lib.nixGL.wrap pkgs.hyprland;
    extraConfig = builtins.readFile ./hypr/hyprland.conf;
  };
  xdg.configFile."hypr" = {
    source = ./hypr;
    recursive = true;
  };
}
