{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      alias = {
        difft = "-c diff.external=difft diff";
      };
      user = {
        name = "kienn-HCl";
        email = "87010782+kienn-HCl@users.noreply.github.com";
      };
      init.defaultBranch = "main";
    };
    # difftastic = {
    #   enable = true;
    #   background = "dark";
    # };
  };
}
