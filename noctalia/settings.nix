# noctalia v5 設定（TOML形式のNix attrset）
# 旧settings.json + colors.json の内容を v5 の config.toml 形式に変換
{
  shell = {
    ui_scale = 1.0;
    corner_radius_scale = 1.0;
    font_family = "Noto Sans CJK JP";
    telemetry_enabled = false;
    avatar_path = "/home/frort/.face";
    clipboard_enabled = true;
    lang = "ja";

    animation = {
      enabled = true;
      speed = 1.0;
    };

    shadow = {
      direction = "down_right";
    };

    panel = {
      borders = false;
      # control centerをバーボタンの近くに表示（旧 position = "close_to_bar_button"）
      open_near_click_control_center = true;
    };

    mpris = {
      # 旧 audio.mprisBlacklist
      blacklist = [ "Firefox" ];
    };
  };

  wallpaper = {
    enabled = true;
    fill_mode = "crop";
    transition = [
      "fade"
      "disc"
      "stripes"
      "wipe"
      "honeycomb"
    ];
    transition_duration = 1500;
    directory = "~/.local/share/Wallpapers";

    automation = {
      enabled = true;
      interval_seconds = 3600; # 旧 randomIntervalSec = 3600
      order = "random";
    };
  };

  theme = {
    mode = "dark";
    source = "custom";
    custom_palette = "jasper-dark"; # customPalettes."jasper-dark" で定義
  };

  notification = {
    position = "bottom_left";
    enable_daemon = true;
    background_opacity = 1.0;
    layer = "overlay"; # 旧 overlayLayer = true
  };

  osd = {
    position = "bottom_left"; # 旧 location = "bottom_left"
    background_opacity = 1.0;
  };

  lockscreen = {
    enabled = true;
    blur_intensity = 0.0; # 旧 lockScreenBlur = 0
    tint_intensity = 0.0; # 旧 lockScreenTint = 0
  };

  nightlight = {
    enabled = false;
    temperature_day = 6500;
    temperature_night = 4000;
  };

  location = {
    auto_locate = false;
    address = "Chofu";
  };

  weather = {
    enabled = true;
    unit = "celsius";
    effects = true;
  };

  audio = {
    enable_overdrive = false; # 旧 volumeOverdrive = false
  };

  brightness = {
    enable_ddcutil = false; # 旧 enableDdcSupport = false
  };

  system.monitor = {
    enabled = true;
  };

  idle.behavior = {
    lock = {
      timeout = 660; # 旧 lockTimeout
      command = "noctalia:session lock";
      enabled = false;
    };
    "screen-off" = {
      timeout = 600; # 旧 screenOffTimeout
      command = "noctalia:dpms-off";
      resume_command = "noctalia:dpms-on";
      enabled = false;
    };
  };

  keybinds = {
    validate = [
      "return"
      "kp_enter"
    ];
    cancel = [ "escape" ];
    left = [ "left" ];
    right = [ "right" ];
    up = [
      "up"
      "ctrl+p"
      "ctrl+k"
    ];
    down = [
      "down"
      "ctrl+n"
      "ctrl+j"
    ];
  };

  # 旧バーはleft位置の縦型バー
  # start = 上端、center = 中央、end = 下端
  bar.main = {
    position = "left";
    scale = 1.3;
    thickness = 40;
    # 旧 frameThickness=8 はフレーム枠の厚みであり bar 全体幅ではない
    # v5 の thickness はバー全体幅（最小10、デフォルト34）
    background_opacity = 0.93;
    radius = 12; # 旧 frameRadius
    margin_ends = 5; # 旧 marginVertical（主軸=縦方向の両端インセット）
    margin_edge = 5; # 旧 marginHorizontal（スクリーン端=左からの距離）
    padding = 2; # 旧 contentPadding
    widget_spacing = 6;
    auto_hide = false;
    reserve_space = true; # 旧 enableExclusionZoneInset
    capsule = true; # 旧 showCapsule

    # 旧 widgets.left → start（上端）
    start = [
      "battery"
      "sysmon"
      "media"
      "audio_visualizer"
      "workspaces"
    ];
    # 旧 widgets.center
    center = [
      "clock"
      "control-center"
    ];
    # 旧 widgets.right → end（下端）
    end = [
      "caffeine" # 旧 KeepAwake
      "theme_mode" # 旧 DarkMode
      "network"
      "bluetooth"
      "volume"
      "brightness"
      "tray"
      "launcher" # 旧 CustomButton（launcher toggle）
      "notifications" # 旧 NotificationHistory
    ];
  };

  dock = {
    enabled = false;
    pinned = [ "firefox-nightly" ];
  };

  desktop_widgets.enabled = true;

  # 旧 controlCenter.shortcuts
  control_center.shortcuts = [
    { type = "wifi"; } # 旧 Network
    { type = "bluetooth"; }
    { type = "wallpaper"; } # 旧 WallpaperSelector
    { type = "notification"; } # 旧 Notifications
    { type = "power_profile"; } # 旧 PowerProfile
    { type = "caffeine"; } # 旧 KeepAwake
    { type = "nightlight"; } # 旧 NightLight
  ];
}
