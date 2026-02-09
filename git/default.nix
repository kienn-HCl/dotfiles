{
  pkgs,
  config,
  lib,
  ...
}:
let
  userConfig = import ../lib/user.nix;
in
{
  programs.git = {
    enable = true;
    settings = {
      alias = {
        difft = "-c diff.external=difft diff";
      };
      user = {
        name = userConfig.git.name;
        email = userConfig.git.email;
      };
      init.defaultBranch = "main";
    };
  };
}
