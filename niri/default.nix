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
in
{
  xdg.configFile = {
    "niri/config.kdl".source =
      config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/niri/config.kdl";
    "niri/config-hosts.kdl".text = configHosts;
    "niri/script" = {
      source = ./niri/script;
      recursive = true;
    };
  };
}
