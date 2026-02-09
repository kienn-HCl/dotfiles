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
  niriConfig =
    (import ./config-hosts.nix { inherit host; }) + (builtins.readFile ./config-common.kdl);
in
{
  xdg.configFile = {
    "niri/config.kdl" = {
      text = niriConfig;
      recursive = true;
    };
    "niri/script" = {
      source = ./niri/script;
      recursive = true;
    };
  };
}
