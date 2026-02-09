let
  hostname = /etc/hostname |> builtins.readFile |> builtins.replaceStrings [ "\n" ] [ "" ];
  hosts = {
    yufuin = {
      waybar = {
        height = 40;
        fontSize = "20";
      };
      niri = {
        xkbLayout = "us,jp";
        defaultColumnWidth = "0.33333";
      };
    };
    default = {
      waybar = {
        height = 30;
        fontSize = "13";
      };
      niri = {
        xkbLayout = "jp,us";
        defaultColumnWidth = "0.5";
      };
    };
  };
  currentHost = if hosts ? "${hostname}" then hosts."${hostname}" else hosts.default;
in
{
  inherit hostname;
  config = currentHost;
  getHostConfig = module: currentHost.${module};
}
