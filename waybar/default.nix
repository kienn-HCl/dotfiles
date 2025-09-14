{ ... }:
let
  hostname = /etc/hostname |> builtins.readFile |> builtins.replaceStrings [ "\n" ] [ "" ];
  hosts = {
    yufuin = {
      height = 40;
      fontSize = "20";
    };
    default = {
      height = 30;
      fontSize = "13";
    };
  };
  config = if hosts ? "${hostname}" then hosts."${hostname}" else hosts.default;
in
{
  xdg.configFile = {
    "waybar/config.jsonc".text = builtins.toJSON (import ./config.nix { inherit (config) height; });
    "waybar/style.css".text = import ./style.css.nix { inherit (config) fontSize; };
  };
}
