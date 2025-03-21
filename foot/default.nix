{ ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        include = "/usr/share/foot/themes/gruvbox-dark";
        font = "HackGenConsoleNF:size=12";
      };
    };
  };
}
