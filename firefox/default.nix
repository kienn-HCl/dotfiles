{ pkgs, config, ... }:
{
  programs.firefox = {
    enable = true;
    package = (config.lib.nixGL.wrap pkgs.latest.firefox-nightly-bin);
    languagePacks = [
      "jp"
    ];
    profiles."default" = {
      isDefault = true;
      search = {
        force = true;
        default = "ddg";
        order = [
          "ddg"
          "google"
        ];
        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          "Home Manager Options" = {
            urls = [
              {
                template = "https://home-manager-options.extranix.com/";
                params = [
                  {
                    name = "release";
                    value = "master";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@hm" ];
          };
        };
      };
      settings = {
        "browser.shell.checkDefaultBrowser" = false;
        "intl.locale.requested" = "ja,en-US";
        "intl.accept_languages" = "ja,en-US,en";
        "media.eme.enabled" = true;
      };
    };
  };
  home.packages = [ pkgs.nixos-icons ];
}
