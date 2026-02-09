{
  pkgs,
  config,
  lib,
  ...
}:
{
  xdg.configFile."mimeapps.list" = {
    source = ./mimeapps.list;
    force = true;
  };
}
