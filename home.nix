{
  inputs,
  config,
  pkgs,
  ...
}:
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
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  nixGL.packages = inputs.nixgl.packages;
#  nixGL.defaultWrapper = "nvidiaPrime";
  nixGL.installScripts = [
#    "nvidia"
    "mesa"
  ];
  home.packages = with pkgs; [

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    # nixgl.auto.nixGLDefault
    # nixgl.auto.nixGLNvidia

    git
    bat
    lsd
    tree
    fzf
    fd
    vim
    neovim
    htop
    gotop
    ffmpeg
    difftastic
    silicon
    cliphist
    screen
    yq
    jq

    pdfcpu
    gnuplot

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
    zathura
    nwg-displays
    nur.repos.zzzsy.zen-browser
    # (config.lib.nixGL.wrap pkgs.bambu-studio)
    (config.lib.nixGL.wrap pkgs.openscad-unstable)
    (config.lib.nixGL.wrap pkgs.freecad-wayland)
    (config.lib.nixGL.wrap pkgs.steam)

    xwayland-satellite

    wineWowPackages.waylandFull
    winetricks
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

  imports = [
    ./git.nix
    ./zsh.nix
    ./rofi.nix
    ./starship.nix
    ./lazygit.nix
    ./hyprland.nix
    ./niri.nix
    ./foot.nix
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  xdg.configFile = {
    "sway" = {
      source = ./sway;
      onChange = "/usr/bin/swaymsg reload";
      recursive = true;
    };
  };
  home.file = {
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
  home.sessionPath = [
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
