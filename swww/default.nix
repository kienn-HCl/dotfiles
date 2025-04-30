{ pkgs, ... }:
{
  home.packages = [
    pkgs.swww
  ];
  home.file.".local/bin/swww_randomize_multi.sh" = {
    executable = true;
    source = ./swww_randomize_multi.sh;
  };
}
