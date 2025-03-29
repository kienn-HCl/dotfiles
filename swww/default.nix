{ pkgs, ... }:
{
  home.packages = [
    pkgs.swww
  ];
  xdg.dataFile."bin/swww_randomize_multi.sh" = {
    executable = true;
    source = ./swww_randomize_multi.sh;
  };
}
