{ pkgs, ... }:
let
  kdlFiles = pkgs.lib.filesystem.listFilesRecursive ./niri;
  filteredKdlFiles = builtins.filter (f: pkgs.lib.strings.hasSuffix ".kdl" (toString f)) kdlFiles;

  hostname = /etc/hostname |> builtins.readFile |> builtins.replaceStrings [ "\n" ] [ "" ];
  hostDepDir = if builtins.pathExists ./niri-${hostname} then ./niri-${hostname} else ./niri-common;
  hostDepFiles = pkgs.lib.filesystem.listFilesRecursive hostDepDir;
  filteredHostFiles = builtins.filter (
    f: pkgs.lib.strings.hasSuffix ".kdl" (toString f)
  ) hostDepFiles;
  congigFile = builtins.concatStringsSep "\n" (
    map builtins.readFile (filteredKdlFiles ++ filteredHostFiles)
  );
in
{
  xdg.configFile = {
    "niri/config.kdl" = {
      text = congigFile;
      recursive = true;
    };
    "niri/script" = {
      source = ./niri/script;
      recursive = true;
    };
  };
  home.packages = [
    # (config.lib.nixGL.wrap pkgs.niri)
    # (pkgs.writeShellScriptBin "set-niri-session" ''
    #   case $1 in
    #       add)
    #           sudo cp ${pkgs.niri}/share/wayland-sessions/niri.desktop /usr/share/wayland-sessions/
    #           ;;
    #       delete)
    #           sudo rm /usr/share/wayland-sessions/niri.desktop
    #           ;;
    #       *)
    #           echo "Usage: $(basename $0) (add|delete)"
    #           exit 1
    #           ;;
    #   esac
    # '')
  ];
  home.file = {
    # ".local/share/systemd/user/niri-shutdown.target".source = "${pkgs.niri}/share/systemd/user/niri-shutdown.target";
    # ".local/share/systemd/user/niri.service".source = "${pkgs.niri}/share/systemd/user/niri.service";
  };
}
