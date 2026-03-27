{
  fontSize ? "13",
  color,
}:
let
  # #RRGGBB → r, g, b の10進数に分解するヘルパー
  hexToCSS =
    hex: alpha:
    let
      hexStr = builtins.substring 1 6 hex;
      r = builtins.substring 0 2 hexStr;
      g = builtins.substring 2 2 hexStr;
      b = builtins.substring 4 2 hexStr;
      hexDigit =
        c:
        let
          digits = {
            "0" = 0;
            "1" = 1;
            "2" = 2;
            "3" = 3;
            "4" = 4;
            "5" = 5;
            "6" = 6;
            "7" = 7;
            "8" = 8;
            "9" = 9;
            "a" = 10;
            "b" = 11;
            "c" = 12;
            "d" = 13;
            "e" = 14;
            "f" = 15;
            "A" = 10;
            "B" = 11;
            "C" = 12;
            "D" = 13;
            "E" = 14;
            "F" = 15;
          };
        in
        digits.${c};
      hexPairToInt =
        s: (hexDigit (builtins.substring 0 1 s)) * 16 + (hexDigit (builtins.substring 1 1 s));
    in
    "rgba(${toString (hexPairToInt r)}, ${toString (hexPairToInt g)}, ${toString (hexPairToInt b)}, ${alpha})";
in
''
  * {
      font-family: 'Noto Sans Mono', 'Font Awesome 6 Free', 'Font Awesome 6 Brands', monospace;
      font-size: ${fontSize}px;
  }

  @define-color inactive_module_color ${color.brightBlack};

  window#waybar {
      background-color: ${hexToCSS color.background0 "0.8"};
      border-color: ${hexToCSS color.background5 "0.5"};
      border-style: solid;
      color: ${color.foreground0};
      transition-property: background-color;
      transition-duration: .5s;
  }

  window#waybar:not(.bottom):not(.left):not(.right) {
      border-bottom-width: 2px;
  }

  window#waybar.bottom {
      border-top-width: 2px;
  }

  window#waybar.hidden {
      opacity: 0.2;
  }

  button {
      /* reset all builtin/theme styles */
      all: unset;
      /* Restore some properties */
      min-height: 24px;
      min-width: 16px;
      padding: 0 10px;
      transition: all 200ms ease-out;
  }

  /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
  button:hover {
      background: inherit;
  }

  window#waybar:not(.bottom):not(.left):not(.right) button:hover{
      box-shadow: inset 0 -2px;
  }

  window#waybar.bottom button:hover {
      box-shadow: inset 0 2px;
  }

  /*
   * Common module rules
   */

  .modules-left > widget > label,
  .modules-center > widget > label,
  .modules-right > widget > label {
      color: inherit;
      margin: 0;
      padding: 0 10px;
  }

  .modules-left > widget > box,
  .modules-center > widget > box,
  .modules-right > widget > box {
      color: inherit;
      margin: 0;
      padding: 0;
  }

  /* If the leftmost module is a box, omit left margin and padding */
  .modules-left > widget:first-child > box {
      margin-left: 0;
      padding-left: 0;
  }

  /* If the rightmost module is a box, omit right margin and padding */
  .modules-right > widget:last-child > box {
      margin-right: 0;
      padding-right: 0;
  }


  /*
   * Draw module underlines
   */
  window#waybar:not(.bottom):not(.left):not(.right) .modules-left > widget > label,
  window#waybar:not(.bottom):not(.left):not(.right) .modules-center > widget > label,
  window#waybar:not(.bottom):not(.left):not(.right) .modules-right > widget > label {
      box-shadow: inset 0 -2px;
  }

  window#waybar.bottom .modules-left > widget > label,
  window#waybar.bottom .modules-center > widget > label,
  window#waybar.bottom .modules-right > widget > label {
      box-shadow: inset 0 2px;
  }

  window#waybar #window {
      box-shadow: none;
  }

  #workspaces button {
      background-color: transparent;
      color: ${color.foreground0};
  }

  #workspaces button:hover {
      background: rgba(0, 0, 0, 0.2);
  }

  #workspaces button.focused {
      background-color: ${color.blue};
  }

  window#waybar:not(.bottom):not(.left):not(.right) #workspaces button.focused {
      box-shadow: inset 0 -2px;
  }

  window#waybar.bottom #workspaces button.focused {
      box-shadow: inset 0 2px;
  }

  #workspaces button.urgent {
      background-color: ${color.brightRed};
  }

  #mode {
      background-color: ${color.blue};
  }

  window#waybar:not(.bottom):not(.left):not(.right) #mode {
      box-shadow: inset 0 -2px;
  }

  window#waybar.bottom #mode {
      box-shadow: inset 0 2px;
  }

  #image {
      margin: 0;
      padding: 0 10px;
  }

  #battery.charging, #battery.plugged {
      color: ${color.brightGreen};
  }

  @keyframes blink {
      to {
          background-color: ${color.foreground0};
          color: ${color.black};
      }
  }

  #battery.critical:not(.charging) {
      color: ${color.brightRed};
      animation-name: blink;
      animation-duration: 0.5s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
  }

  #network.disconnected,
  #pulseaudio.muted,
  #wireplumber.muted {
      color: @inactive_module_color;
  }

  #tray {
      padding: 0 5px;
  }

  #tray > .passive {
      -gtk-icon-effect: dim;
  }

  @keyframes needs-attention {
      to {
          background-color: ${hexToCSS color.brightRed "0.5"};
      }
  }

  #tray > .needs-attention {
      -gtk-icon-effect: highlight;
      animation-name: needs-attention;
      animation-duration: 1s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
      background-color: transparent;
  }

  #idle_inhibitor {
      color: @inactive_module_color;
  }

  #idle_inhibitor.activated {
      color: inherit;
  }

  #mpd.disconnected,
  #mpd.paused,
  #mpd.stopped {
      color: @inactive_module_color;
  }

  #cpu.high,
  #temperature.critical {
      color: ${color.brightRed};
  }

  #language {
      min-width: 16px;
  }

  #keyboard-state {
      min-width: 16px;
  }

  #keyboard-state > label {
      padding: 0 5px;
  }

  #keyboard-state > label.locked {
      background: rgba(0, 0, 0, 0.2);
  }

  #scratchpad {
      background: rgba(0, 0, 0, 0.2);
  }

  #scratchpad.empty {
  	background-color: transparent;
  }


  /*
   * Module colors
   */
  #cpu {
      color: ${color.brightGreen};
  }

  #memory {
      color: ${color.brightMagenta};
  }

  #disk {
      color: ${color.yellow};
  }

  #backlight {
      color: ${color.cyan};
  }

  #network {
      color: ${color.brightBlue};
  }

  #pulseaudio,
  #wireplumber {
      color: ${color.brightYellow};
  }

  #temperature {
      color: ${color.orange};
  }

  #mpd {
      color: ${color.brightGreen};
  }

  #mpd.paused {
      color: ${color.green};
  }

  #language {
      color: ${color.brightCyan};
  }

  #keyboard-state {
      color: ${color.brightGreen};
  }
''
