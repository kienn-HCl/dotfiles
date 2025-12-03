{ ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      gui.nerdFontsVersion = "3";
      git.pagers = [
        { externalDiffCommand = "difft --color=always"; }
      ];
    };
  };
}
