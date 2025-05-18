{
  inputs,
  config,
  pkgs,
  ...
}:
let
  isNvidia = if builtins.pathExists /usr/bin/nvidia-smi then true else false;
in
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
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
    permittedInsecurePackages = [
      "electron-33.4.11"
    ];
  };

  nixGL.packages = inputs.nixgl.packages;
  nixGL.defaultWrapper = if isNvidia then "nvidia" else "mesa";
  nixGL.installScripts = if isNvidia then [ "nvidia" ] else [ "mesa" ];

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
    # neovim
    htop
    gotop
    ffmpeg
    difftastic
    silicon
    cliphist
    screen
    yq
    jq
    dex
    bitwarden-cli
    (config.lib.nixGL.wrap imv)
    lsix

    pdfcpu
    gnuplot
    # platformio

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
    nwg-displays
    obsidian
    feishin
    xfce.thunar
    # (config.lib.nixGL.wrap pkgs.bambu-studio)
    (config.lib.nixGL.wrap pkgs.openscad-unstable)
    (config.lib.nixGL.wrap pkgs.freecad-wayland)
    # (config.lib.nixGL.wrap pkgs.steam)

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
    ./git
    ./zsh
    ./rofi
    ./starship
    ./lazygit
    ./hyprland
    ./niri
    ./foot
    ./mpv
    ./firefox
    ./mimeapps
    ./sway
    ./direnv
    ./swww
    ./emacs
    ./nvim
    ./zathura
  ];

  home.file = {
    ".local/bin" = {
      executable = true;
      recursive = true;
      source = ./local/bin;
    };
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

  home.keyboard = {
    layout = "jp,us";
    options = [
      "ctrl:nocaps"
      "grp:shifts_toggle"
    ];
  };

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };
  home.sessionVariables.XDG_DATA_HOME = "${config.xdg.dataHome}";
  xdg.dataFile."Wallpapers" = {
    source = ./Wallpapers;
    recursive = true;
  };
  home.sessionVariables.XDG_CONFIG_HOME = "${config.xdg.configHome}";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
