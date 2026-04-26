{
  pkgs,
  config,
  lib,
  ...
}:
let
  color = import ../lib/color;
  noctaliaPkg = config.lib.nixGL.wrap pkgs.noctalia-shell;
  # noctalia-shell を起動する WM の systemd サービス名(複数指定可)
  wmServices = [ "niri.service" ];
in
{
  home.packages = [
    pkgs.quickshell
    (config.lib.nixGL.wrap pkgs.gpu-screen-recorder)
    pkgs.cava
  ];

  programs.noctalia-shell = {
    enable = true;
    package = noctaliaPkg;
    # systemd.enable は graphical-session.target に紐づくため、
    # KDE/GNOME など他のデスクトップでも起動されてしまう。
    # niri 専用シェルなので、niri.service に直接紐づけた自前サービスを使う。

    settings = import ./settings.nix;

    colors = {
      mPrimary = color.cyan;
      mSecondary = color.blue;
      mTertiary = color.magenta;
      mError = color.red;
      mHover = color.magenta;
      mOnPrimary = color.background2;
      mOnSecondary = color.background2;
      mOnTertiary = color.background2;
      mOnError = color.background2;
      mOnHover = color.background2;
      mOnSurface = color.foreground0;
      mOnSurfaceVariant = color.gray;
      mOutline = color.ash;
      mSurface = color.background0;
      mSurfaceVariant = color.background4;
      mShadow = color.background5;
    };

    plugins = {
      sources = [
        {
          enabled = true;
          name = "Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = { };
      version = 1;
    };
  };

  systemd.user.services.noctalia-shell = {
    Unit = {
      Description = "Noctalia Shell - Wayland desktop shell";
      After = wmServices;
      StopWhenUnneeded = true;
    };

    Service = {
      ExecStart = lib.getExe noctaliaPkg;
      Restart = "on-failure";
    };

    Install.WantedBy = wmServices;

    Unit.X-Restart-Triggers =
      let
        cfg = config.programs.noctalia-shell;
      in
      lib.optional (cfg.settings != { }) config.xdg.configFile."noctalia/settings.json".source
      ++ lib.optional (cfg.colors != { }) config.xdg.configFile."noctalia/colors.json".source
      ++ lib.optional (cfg.plugins != { }) config.xdg.configFile."noctalia/plugins.json".source;
  };
}
