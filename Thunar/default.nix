{
  pkgs,
  config,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    thunar
    thunar-volman
    thunar-vcs-plugin
    thunar-archive-plugin
    thunar-media-tags-plugin
    tumbler
  ];
  xdg.configFile."Thunar" = {
    source = ./Thunar;
    recursive = true;
    force = true;
  };
}
