{
  pkgs,
  config,
  lib,
  ...
}:
let
  color = import ../lib/color;
  helpers = import ../lib/helpers.nix;
  inherit (helpers) trimSharp;
  nfwidth = import ../pkgs/nfwidth.nix { inherit pkgs; };
in
{
  programs.foot = {
    enable = true;
    package = pkgs.symlinkJoin {
      name = "foot-nfwidth";
      paths = [ pkgs.foot ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        for bin in foot footclient; do
          wrapProgram $out/bin/$bin \
            --prefix LD_PRELOAD : "${nfwidth}/lib/libnfwidth.so"
        done
      '';
    };
    settings = {
      main = {
        font = "HackGen Console:size=12, Hack Nerd Font:size=12";
      };
      colors-dark = {
        background = trimSharp color.background0;
        foreground = trimSharp color.foreground0;

        selection-background = trimSharp color.background1;
        selection-foreground = trimSharp color.foreground1;

        regular0 = trimSharp color.black;
        regular1 = trimSharp color.red;
        regular2 = trimSharp color.green;
        regular3 = trimSharp color.yellow;
        regular4 = trimSharp color.blue;
        regular5 = trimSharp color.magenta;
        regular6 = trimSharp color.cyan;
        regular7 = trimSharp color.white;

        bright0 = trimSharp color.brightBlack;
        bright1 = trimSharp color.brightRed;
        bright2 = trimSharp color.brightGreen;
        bright3 = trimSharp color.brightYellow;
        bright4 = trimSharp color.brightBlue;
        bright5 = trimSharp color.brightMagenta;
        bright6 = trimSharp color.brightCyan;
        bright7 = trimSharp color.brightWhite;
      };
    };
  };
}
