{ pkgs, ... }:
{
  gtk = {
    enable = true;
    gtk2 = {
      force = true;
      extraConfig = ''
        gtk-key-theme-name = "Emacs"
        gtk-decoration-layout=menu:close
      '';
    };
    gtk3.extraConfig = {
      gtk-key-theme-name = "Emacs";
      gtk-decoration-layout = "menu:close";
    };
    gtk4.extraConfig = {
      gtk-key-theme-name = "Emacs";
      gtk-decoration-layout = "menu:close";
    };
    iconTheme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-icon-theme;
    };
    theme = {
      name = "Jasper-Dark";
      package = pkgs.jasper-gtk-theme;
    };
  };
}
