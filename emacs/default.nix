{ config, ... }:
{
  programs.emacs = {
    enable = true;
  };
  home.file = {
    ".emacs.d/init.el".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/emacs/init.el";
    ".emacs.d/early-init.el".source = config.lib.file.mkOutOfStoreSymlink "${config.xdg.configHome}/home-manager/emacs/early-init.el";
  };
}
