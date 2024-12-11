{ config, pkgs, lib, nixgl, ... }:
rec {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "frort";
  home.homeDirectory = "/home/frort";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.

  nixGL.packages = nixgl.packages;
  home.packages = with pkgs; [
    (config.lib.nixGL.wrap hyprland)
    (pkgs.writeShellScriptBin "set-hyprland-session" ''
        case $1 in
            add)
                sudo cp ${pkgs.hyprland}/share/wayland-sessions/hyprland.desktop /usr/share/wayland-sessions/
                ;;
            delete)
                sudo rm /usr/share/wayland-sessions/hyprland.desktop
                ;;
            *)
                echo "Usage: $(basename $0) (add|delete)"
                exit 1
                ;;
        esac
    '')
    (config.lib.nixGL.wrap niri)
    (pkgs.writeShellScriptBin "set-niri-session" ''
        case $1 in
            add)
                sudo cp ${pkgs.niri}/share/wayland-sessions/niri.desktop /usr/share/wayland-sessions/
                ;;
            delete)
                sudo rm /usr/share/wayland-sessions/niri.desktop
                ;;
            *)
                echo "Usage: $(basename $0) (add|delete)"
                exit 1
                ;;
        esac
    '')
    (config.lib.nixGL.wrap river)
    (pkgs.writeShellScriptBin "set-river-session" ''
        case $1 in
            add)
                sudo cp ${pkgs.river}/share/wayland-sessions/river.desktop /usr/share/wayland-sessions/
                ;;
            delete)
                sudo rm /usr/share/wayland-sessions/river.desktop
                ;;
            *)
                echo "Usage: $(basename $0) (add|delete)"
                exit 1
                ;;
        esac
    '')

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    git
    lazygit
    bat
    lsd
    tree
    starship
    delta
    fzf
    fd
    vim
    neovim
    htop
    gotop
    ffmpeg
    difftastic
    silicon

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    hackgen-nf-font

    go
    deno
    (rust-bin.stable.latest.default.override {
      # target = ["wasm32-unknown-unknown" "wasm32-wasi"];
    })

    discord
    slack
    zulip
    spotify

    gnuplot

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  xdg.configFile = {
    "rofi".source = ./rofi ;
    "sway" = {
      source = ./sway ;
      onChange = "/usr/bin/swaymsg reload";
    };
  };
  home.file = {
    ".local/share/systemd/user/niri-shutdown.target".source = "${pkgs.niri}/share/systemd/user/niri-shutdown.target" ;
    ".local/share/systemd/user/niri.service".source = "${pkgs.niri}/share/systemd/user/niri.service" ;
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  programs.git = {
    enable = true;
    userName = "kienn-HCl";
    userEmail = "87010782+kienn-HCl@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
    difftastic = {
      enable = true;
      background = "dark";
    };
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {
        include = "/usr/share/foot/themes/gruvbox-dark";
        font = "HackGenConsoleNF:size=12";
      };
    };
  };

  imports = [
    ./zsh.nix
    ./rofi.nix
    ./starship.nix
  ];

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/frort/etc/profile.d/hm-session-vars.sh
  #
  home.sessionPath= [
    "$HOME/go/bin"
    "$HOME/.local/bin"
  ];
  home.sessionVariables = {
    # EDITOR = "emacs";
    XDG_CONFIG_HOME = "${home.homeDirectory}/.config";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
