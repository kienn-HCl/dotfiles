{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
let
  color = import ../lib/color;
  noctaliaPkg = config.lib.nixGL.wrap (inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default);
  wmServices = [ "niri.service" ];
in
{
  home.packages = [
    (config.lib.nixGL.wrap pkgs.gpu-screen-recorder)
    pkgs.cava
  ];

  programs.noctalia = {
    enable = true;
    package = noctaliaPkg;
    # nixGL環境ではビルドサンドボックス内にGPUドライバがないため検証を無効化
    validateConfig = false;

    settings = import ./settings.nix;

    customPalettes."jasper-dark" = {
      dark = {
        primary = color.cyan;
        onPrimary = color.background2;
        secondary = color.blue;
        onSecondary = color.background2;
        tertiary = color.magenta;
        onTertiary = color.background2;
        error = color.red;
        onError = color.background2;
        surface = color.background0;
        onSurface = color.foreground0;
        surfaceVariant = color.background4;
        onSurfaceVariant = color.gray;
        outline = color.ash;
        shadow = color.background5;
        hover = color.magenta;
        onHover = color.background2;
        # parseCommunityPaletteJson は terminal キーが必須
        terminal = {
          foreground = color.foreground0;
          background = color.background0;
          cursor = color.cyan;
          cursorText = color.background0;
          selectionFg = color.foreground1;
          selectionBg = color.background1;
          normal = {
            black = color.black;
            red = color.red;
            green = color.green;
            yellow = color.yellow;
            blue = color.blue;
            magenta = color.magenta;
            cyan = color.cyan;
            white = color.white;
          };
          bright = {
            black = color.brightBlack;
            red = color.brightRed;
            green = color.brightGreen;
            yellow = color.brightYellow;
            blue = color.brightBlue;
            magenta = color.brightMagenta;
            cyan = color.brightCyan;
            white = color.brightWhite;
          };
        };
      };
    };
  };

  systemd.user.services.noctalia = {
    Unit = {
      Description = "Noctalia Shell - Wayland desktop shell";
      After = wmServices;
      StopWhenUnneeded = true;
      X-Restart-Triggers =
        lib.optional (config.programs.noctalia.settings != { })
          "${config.xdg.configFile."noctalia/config.toml".source}"
        ++ lib.mapAttrsToList (
          name: _: "${config.xdg.configFile."noctalia/palettes/${name}.json".source}"
        ) config.programs.noctalia.customPalettes;
    };

    Service = {
      ExecStart = lib.getExe noctaliaPkg;
      Restart = "on-failure";
    };

    Install.WantedBy = wmServices;
  };
}
