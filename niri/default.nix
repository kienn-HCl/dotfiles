{
  pkgs,
  config,
  lib,
  ...
}:
let
  hosts = import ../lib/hosts.nix;
  hostConfig = hosts.getHostConfig "niri";
  host = {
    input.xkb.keyboard.layout = hostConfig.xkbLayout;
    layout.default-column-width.proportion = hostConfig.defaultColumnWidth;
  };
  configHosts = import ./config-hosts.nix { inherit host; };
  color = import ../lib/color;
in
{
  xdg.configFile = {
    "niri/config.kdl".source =
      config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/niri/config.kdl";
    "niri/config-hosts.kdl".text = configHosts;
    "niri/config-colors.kdl".text = ''
      overview {
          backdrop-color "${color.background0}"
      }
      layout {
          focus-ring {
              active-color "${color.cyan}"
              inactive-color "${color.brightBlack}"
              urgent-color "${color.brightRed}"
          }
          border {
              active-color "${color.brightCyan}"
              inactive-color "${color.background5}"
          }
          tab-indicator {
              urgent-color "${color.brightRed}"
          }
      }
    '';
    "niri/script" = {
      source = ./niri/script;
      recursive = true;
    };
  };
}
