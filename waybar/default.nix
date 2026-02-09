{
  pkgs,
  config,
  lib,
  ...
}:
let
  hosts = import ../lib/hosts.nix;
  hostConfig = hosts.getHostConfig "waybar";
in
{
  xdg.configFile = {
    "waybar/config.jsonc".text = builtins.toJSON (import ./config.nix { inherit (hostConfig) height; });
    "waybar/style.css".text = import ./style.css.nix { inherit (hostConfig) fontSize; };
  };
}
