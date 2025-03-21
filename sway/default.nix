{ ... }:
{
  xdg.configFile = {
    "sway" = {
      source = ./sway;
      onChange = "/usr/bin/swaymsg reload";
      recursive = true;
    };
  };
}
