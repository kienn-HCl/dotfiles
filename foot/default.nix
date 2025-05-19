{ ... }:
let
  color = import ../lib/color/kanagawa-dragon.nix;
  trimSharp = color: builtins.replaceStrings [ "#" ] [ "" ] color;
in
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        # include = "/usr/share/foot/themes/gruvbox-dark";
        font = "HackGenConsoleNF:size=12";
      };
      colors = {
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
