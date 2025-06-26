{ ... }:
let
  hostname = /etc/hostname |> builtins.readFile |> builtins.replaceStrings [ "\n" ] [ "" ];
  heightSet = {
    yufuin = 40;
    default = 30;
  };
  fontSizeSet = {
    yufuin = "20";
    default = "13";
  };
  height = if heightSet ? "${hostname}" then heightSet."${hostname}" else heightSet.default;
  fontSize = if fontSizeSet ? "${hostname}" then fontSizeSet."${hostname}" else fontSizeSet.default;
in
{
  xdg.configFile = {
    "waybar/config.jsonc".text = builtins.toJSON (import ./config.nix { inherit height; });
    "waybar/style.css".text = import ./style.css.nix { inherit fontSize; };
  };
}
