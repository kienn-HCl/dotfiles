{ ... }:
{
  programs.git = {
    enable = true;
    userName = "kienn-HCl";
    userEmail = "87010782+kienn-HCl@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
    difftastic = {
      enable = true;
      background = "dark";
    };
  };
}
