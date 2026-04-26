{
  inputs,
  config,
  pkgs,
  ...
}:
let
  userConfig = import ./lib/user.nix;
  isNvidia = builtins.pathExists /usr/bin/nvidia-smi;
in
{
  home.username = userConfig.username;
  home.homeDirectory = userConfig.homeDirectory;

  home.stateVersion = "25.05";

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
    # silicon
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
    claude-code
    glow
    inputs.ksk.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.romv.packages.${pkgs.stdenv.hostPlatform.system}.default

    pdfcpu

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    hackgen-font
    nerd-fonts.hack

    uv

    discord
    spotify
    # nwg-displays
    obsidian
    feishin
    zoom-us
    # (config.lib.nixGL.wrap bambu-studio)
    (config.lib.nixGL.wrap openscad)
    # (config.lib.nixGL.wrap freecad-wayland)
    # (config.lib.nixGL.wrap steam)
    libreoffice
    synology-drive-client

    xwayland-satellite

    # wineWowPackages.waylandFull
    winetricks

    (spotify-player.override { withAudioBackend = "pulseaudio"; })
  ];

  imports = [
    inputs.nix-hazkey.homeModules.hazkey
    inputs.noctalia.homeModules.default
    ./direnv
    ./firefox
    ./foot
    ./git
    ./gtk
    ./hyprland
    ./lazygit
    ./mimeapps
    ./mpv
    # ./nextcloud
    ./niri
    ./noctalia
    ./nvim
    ./rofi
    ./starship
    ./sway
    ./swww
    ./Thunar
    ./waybar
    ./ydotool
    ./zathura
    ./zsh
  ];

  services.hazkey.enable = true;
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
  };

  # fcitx5 systemd serviceに必要な環境変数を追加
  # Nixのパスを配置してOSのfcitx5とのミスマッチを防ぐ
  systemd.user.services.fcitx5-daemon.Service.Environment = [
    "XDG_DATA_DIRS=${config.home.homeDirectory}/.nix-profile/share:/nix/var/nix/profiles/default/share"
  ];

  home.file = {
    ".local/bin" = {
      executable = true;
      recursive = true;
      source = ./local/bin;
    };
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

  fonts.fontconfig.enable = true;

  xdg.enable = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    setSessionVariables = false;
  };
  home.sessionVariables.XDG_DATA_HOME = "${config.xdg.dataHome}";
  xdg.dataFile."Wallpapers" = {
    source = ./Wallpapers;
    recursive = true;
  };
  home.sessionVariables.XDG_CONFIG_HOME = "${config.xdg.configHome}";

  programs.home-manager.enable = true;
}
