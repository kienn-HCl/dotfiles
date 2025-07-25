{ pkgs, ... }:
{
  home.packages = [ pkgs.ydotool ];
  systemd.user.services.ydotool = {
    Unit.Description = "Starts ydotoold service";
    Service = {
      Type = "simple";
      Restart = "always";
      ExecStart = "${pkgs.ydotool}/bin/ydotoold";
      ExecReload = "/usr/bin/kill -HUP $MAINPID";
      KillMode = "process";
      TimeoutSec = 180;

    };
    Install.WantedBy = [ "default.target" ];
  };
}
