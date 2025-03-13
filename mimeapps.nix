{ pkgs, ... }:
{
  xdg.configFile."mimeapps.list".text = ''
  [Added Associations]
  text/html=firefox-nightly.desktop;org.mozilla.firefox.desktop
  application/xhtml+xml=firefox-nightly.desktop;org.mozilla.firefox.desktop
  x-scheme-handler/http=firefox-nightly.desktop;org.mozilla.firefox.desktop
  x-scheme-handler/https=firefox-nightly.desktop;org.mozilla.firefox.desktop
  [Default Applications]
  text/html=firefox-nightly.desktop
  application/xhtml+xml=firefox-nightly.desktop
  x-scheme-handler/http=firefox-nightly.desktop
  x-scheme-handler/https=firefox-nightly.desktop
  '';
}
