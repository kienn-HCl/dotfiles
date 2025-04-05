{ ... }:
{
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [
      epkgs.magit
      epkgs.evil
      epkgs.gruvbox-theme
    ];
  };
}
