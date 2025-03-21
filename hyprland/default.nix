{ pkgs, config, ... }:
{
  wayland.windowManager.hyprland = {
    enable = false;
    package = config.lib.nixGL.wrap pkgs.hyprland;
    extraConfig = builtins.readFile ./hypr/hyprland.conf;
  };
  xdg.configFile."hypr" = {
    source = ./hypr;
    recursive = true;
  };
  # home.packages = [
  #   (pkgs.writeShellScriptBin "set-hyprland-session" ''
  #     case $1 in
  #         add)
  #             sudo cp ${pkgs.hyprland}/share/wayland-sessions/hyprland.desktop /usr/share/wayland-sessions/
  #             ;;
  #         delete)
  #             sudo rm /usr/share/wayland-sessions/hyprland.desktop
  #             ;;
  #         *)
  #             echo "Usage: $(basename $0) (add|delete)"
  #             exit 1
  #             ;;
  #     esac
  #   '')
  # ];
}
