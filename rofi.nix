{ pkgs, ...}: {
  home.packages = [ pkgs.rofi-wayland ];
  xdg.configFile."rofi".source = ./rofi ;
}
