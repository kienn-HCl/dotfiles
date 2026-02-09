{
  pkgs,
  config,
  lib,
  ...
}:
{
  services.nextcloud-client = {
    enable = true;
    package = (config.lib.nixGL.wrap pkgs.nextcloud-client);
    startInBackground = true;
  };
}
