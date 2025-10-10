{ pkgs, config, ... }:
{
  programs.emacs = {
    package = pkgs.emacs-git;
    enable = true;
    extraPackages = epkgs: [
      epkgs.magic-latex-buffer
      epkgs.gruvbox-theme
      epkgs.rainbow-delimiters
      epkgs.nerd-icons
      epkgs.nerd-icons-completion
      epkgs.nerd-icons-corfu
      epkgs.nerd-icons-dired
      epkgs.vertico
      epkgs.marginalia
      epkgs.orderless
      epkgs.corfu
      epkgs.dired-subtree
      epkgs.trashed
      epkgs.undo-tree
      epkgs.key-chord
      epkgs.evil
      epkgs.evil-surround
      epkgs.evil-matchit
      epkgs.magit
      epkgs.org
      epkgs.company
      pkgs.texlab
      pkgs.gopls
    ];
  };
  home.file = {
    ".emacs.d/init.el".source =
      config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/emacs/init.el";
    ".emacs.d/early-init.el".source =
      config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/emacs/early-init.el";
  };
}
