{ pkgs, ... }:
{
  gtk = {
    enable = true;
    gtk2.extraConfig = ''gtk-key-theme-name = "Emacs"'';
    gtk3.extraConfig.gtk-key-theme-name = "Emacs";
    gtk4.extraConfig.gtk-key-theme-name = "Emacs";
    iconTheme = {
      name = "Kanagawa";
      package = pkgs.kanagawa-icon-theme;
    };
    theme = {
      name = "Kanagawa-B";
      package = pkgs.kanagawa-gtk-theme;
    };
  };
}
