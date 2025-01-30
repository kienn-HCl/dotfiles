{ pkgs, config, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = config.lib.nixGL.wrap pkgs.hyprland;
    extraConfig = builtins.readFile ./hypr/hyprland.conf;
  };
  home.packages = [
    (pkgs.writeShellScriptBin "set-hyprland-session" ''
      case $1 in
          add)
              sudo cp ${pkgs.hyprland}/share/wayland-sessions/hyprland.desktop /usr/share/wayland-sessions/
              ;;
          delete)
              sudo rm /usr/share/wayland-sessions/hyprland.desktop
              ;;
          *)
              echo "Usage: $(basename $0) (add|delete)"
              exit 1
              ;;
      esac
    '')
  ];
}
