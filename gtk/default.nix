{ pkgs, ... }:
{
  gtk = {
    enable = true;
    gtk2.extraConfig = ''
      gtk-key-theme-name = "Emacs"
      gtk-decoration-layout=menu:close
    '';
    gtk3.extraConfig = {
      gtk-key-theme-name = "Emacs";
      gtk-decoration-layout = "menu:close";
    };
    gtk4.extraConfig = {
      gtk-key-theme-name = "Emacs";
      gtk-decoration-layout = "menu:close";
    };
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
