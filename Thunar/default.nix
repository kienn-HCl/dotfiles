{ pkgs, ... }:
{
  home.packages = with pkgs; [
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-vcs-plugin
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
    xfce.tumbler
  ];
  xdg.configFile."Thunar" = {
    source = ./Thunar;
    recursive = true;
    force = true;
  };
}
