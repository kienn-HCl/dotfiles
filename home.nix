{
  inputs,
  config,
  pkgs,
  ...
}:
let
  isNvidia = if builtins.pathExists /usr/bin/nvidia-smi then true else false;
in
{
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
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
      "pipe-operators"
    ];
  };
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
    permittedInsecurePackages = [
      "electron-36.9.5"
    ];
  };

  targets.genericLinux.nixGL = {
    packages = inputs.nixgl.packages;
    defaultWrapper = if isNvidia then "nvidia" else "mesa";
    installScripts = if isNvidia then [ "nvidia" ] else [ "mesa" ];
  };

  home.packages = with pkgs; [
    git
    bat
    lsd
    tree
    fzf
    fd
    vim
    htop
    gotop
    btop
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
    comma
    entr

    pdfcpu

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    hackgen-nf-font

    uv

    discord
    spotify
    # nwg-displays
    obsidian
    feishin
    zoom-us
    # (config.lib.nixGL.wrap pkgs.bambu-studio)
    (config.lib.nixGL.wrap pkgs.openscad)
    (config.lib.nixGL.wrap pkgs.freecad-wayland)
    # (config.lib.nixGL.wrap pkgs.steam)
    libreoffice

    xwayland-satellite

    wineWowPackages.waylandFull
    winetricks
  ];

  imports = [
    ./direnv
    # ./emacs
    ./firefox
    ./foot
    ./git
    ./gtk
    ./hyprland
    ./lazygit
    ./mimeapps
    ./mpv
    ./nextcloud
    ./niri
    ./nvim
    ./rofi
    ./starship
    ./sway
    ./swaync
    ./swww
    ./Thunar
    ./waybar
    ./ydotool
    ./zathura
    ./zsh
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
  home.sessionVariables = {
    MEMODIR = "$HOME/obsidian/default/memo";
    TODODIR = "$HOME/obsidian/default/00-todo.md";
  };
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
