{
  pkgs,
  config,
  lib,
  ...
}:
let
  color = import ../lib/color/kanagawa-dragon.nix;
  # #RRGGBB → RRGGBBff (hyprland rgba format)
  toHyprColor = hex: (builtins.substring 1 6 hex) + "ff";
  toHyprColorAlpha = hex: alpha: (builtins.substring 1 6 hex) + alpha;
in
{
  wayland.windowManager.hyprland = {
    enable = false;
    package = config.lib.nixGL.wrap pkgs.hyprland;
    extraConfig = builtins.readFile ./hypr/hyprland.conf;
  };
  xdg.configFile = {
    "hypr" = {
      source = ./hypr;
      recursive = true;
    };
    "hypr/colors.conf".text = ''
      # Kanagawa Dragon colors (generated from kanagawa-dragon.nix)
      $active_border = rgba(${toHyprColor color.green})
      $inactive_border = rgba(${toHyprColorAlpha color.background5 "aa"})
      $group_active = rgba(${toHyprColor color.green})
      $group_inactive = rgba(${toHyprColorAlpha color.background5 "ff"})
      $groupbar_text = rgba(${toHyprColor color.foreground0})
      $lock_outer = rgb(${builtins.substring 1 6 color.background4})
      $lock_inner = rgb(${builtins.substring 1 6 color.foreground1})
      $lock_font = rgb(${builtins.substring 1 6 color.black})
      $lock_check = rgb(${builtins.substring 1 6 color.yellow})
      $lock_fail = rgb(${builtins.substring 1 6 color.red})
    '';
  };
}
