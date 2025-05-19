{
  height ? 30,
}:
{
  # layer = "top";
  height = height;
  spacing = 4;
  modules-left = [
    "niri/workspaces"
    "niri/window"
  ];
  modules-center = [
    "clock"
  ];
  modules-right = [
    "idle_inhibitor"
    "pulseaudio"
    "network"
    "power-profiles-daemon"
    "cpu"
    "memory"
    "temperature"
    "backlight"
    "battery"
    "tray"
  ];
  backlight = {
    format = "{percent}% {icon}";
    format-icons = [
      "🌑"
      "🌘"
      "🌗"
      "🌖"
      "🌕"
    ];
  };
  battery = {
    format = "{capacity}% {icon}";
    format-alt = "{time} {icon}";
    format-charging = "{capacity}% ";
    format-full = "{capacity}% {icon}";
    format-icons = [
      ""
      ""
      ""
      ""
      ""
    ];
    format-plugged = "{capacity}% ";
    states = {
      critical = 15;
      warning = 30;
    };
  };
  "battery#bat2" = {
    bat = "BAT2";
  };
  clock = {
    format = "{:%m-%d%H:%M}";
    format-alt = "{:%Y-%m-%d}";
    tooltip-format = ''
      <big>{:%Y %B}</big>
      <tt><small>{calendar}</small></tt>'';
  };
  cpu = {
    format = "{usage}% ";
    tooltip = false;
  };
  idle_inhibitor = {
    format = "{icon}";
    format-icons = {
      activated = "";
      deactivated = "";
    };
  };
  memory = {
    format = "{}% ";
  };
  network = {
    format-alt = "{ifname}: {ipaddr}/{cidr}";
    format-disconnected = "Disconnected ⚠";
    format-ethernet = "";
    format-linked = "{ifname} (No IP) ";
    format-wifi = "";
    tooltip-format = "{ifname} via {gwaddr} ";
  };
  "niri/window" = {
    icon = "true";
    rewrite = {
      "(.*) - zsh" = "> [$1]";
      "(.*) — (.*)Firefox(.*)" = "🌎 $1";
    };
    title = "{}";
  };
  "niri/workspaces" = {
    format = "{value}";
    format-icons = {
      active = "";
      browser = "";
      chat = "<b></b>";
      default = "";
      discord = "";
    };
  };
  power-profiles-daemon = {
    format = "{icon}";
    format-icons = {
      balanced = "";
      default = "";
      performance = "";
      power-saver = "";
    };
    tooltip = true;
    tooltip-format = ''
      Power profile: {profile}
      Driver: {driver}'';
  };
  pulseaudio = {
    format = "{volume}% {icon} {format_source}";
    format-bluetooth = "{volume}% {icon} {format_source}";
    format-bluetooth-muted = " {icon} {format_source}";
    format-icons = {
      car = "";
      default = [
        ""
        ""
        ""
      ];
      hands-free = "";
      headphone = "";
      headset = "";
      phone = "";
      portable = "";
    };
    format-muted = " {format_source}";
    format-source = "{volume}% ";
    format-source-muted = "";
    on-click = "pavucontrol";
  };
  "sway/mode" = {
    format = "<span style=\"italic\">{}</span>";
  };
  "sway/scratchpad" = {
    format = "{icon} {count}";
    format-icons = [
      ""
      ""
    ];
    show-empty = false;
    tooltip = true;
    tooltip-format = "{app}: {title}";
  };
  temperature = {
    critical-threshold = 80;
    format = "{temperatureC}°C {icon}";
    format-icons = [
      ""
      ""
      ""
    ];
  };
  tray = {
    spacing = 5;
  };
}
