{ pkgs, config, ... }:
{
  programs.mpv = {
    enable = true;
    package = pkgs.mpv-unwrapped.wrapper {
      mpv = (config.lib.nixGL.wrap (pkgs.mpv-unwrapped.override { sixelSupport = true; }));
    };
  };
}
