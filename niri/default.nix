{ pkgs, ... }:
let
  hostname = /etc/hostname |> builtins.readFile |> builtins.replaceStrings [ "\n" ] [ "" ];
  hosts = {
    yufuin = {
      input.xkb.keyboard.layout = "us,jp";
      layout.default-column-width.proportion = "0.33333";
    };
    default = {
      input.xkb.keyboard.layout = "jp,us";
      layout.default-column-width.proportion = "0.5";
    };
  };
  host = if hosts ? "${hostname}" then hosts."${hostname}" else hosts.default;
  config = (import ./config-hosts.nix {inherit host;}) + (builtins.readFile ./config-common.kdl);
in
{
  xdg.configFile = {
    "niri/config.kdl" = {
      text = config;
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
