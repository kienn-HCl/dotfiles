{
  pkgs,
  config,
  lib,
  ...
}:
let
  color = import ../lib/color;
in
{
  home.packages = [ pkgs.rofi ];
  xdg.configFile = {
    "rofi/config.rasi".source =
      config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/rofi/rofi/config.rasi";
    "rofi/theme.rasi".text = ''
      * {
          bg-col:  ${color.background0};
          bg-col-light: ${color.background4};
          border-col: ${color.brightBlack};
          selected-col: ${color.background5};
          green: ${color.green};
          fg-col: ${color.foreground0};
          fg-col2: ${color.foreground1};
          grey: ${color.gray};
          width: 600;
      }
    '';
  };
}
