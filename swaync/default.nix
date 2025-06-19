{ ... }:
{
  services.swaync = {
    enable = true;
  };
  xdg.configFile."swaync" = {
    source = ./swaync;
    recursive = true;
    force = true;
  };
}
