{
  fontSize ? "13",
}:
''
  * {
      font-family: 'Noto Sans Mono', 'Font Awesome 6 Free', 'Font Awesome 6 Brands', monospace;
      font-size: ${fontSize}px;
  }

  @define-color inactive_module_color #a9a9a9;

  window#waybar {
      background-color: rgba(43, 48, 59, 0.8);
      border-color: rgba(100, 114, 125, 0.5);
      border-style: solid;
      color: #ffffff;
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
      color: #ffffff;
  }

  #workspaces button:hover {
      background: rgba(0, 0, 0, 0.2);
  }

  #workspaces button.focused {
      background-color: #64727D;
  }

  window#waybar:not(.bottom):not(.left):not(.right) #workspaces button.focused {
      box-shadow: inset 0 -2px;
  }

  window#waybar.bottom #workspaces button.focused {
      box-shadow: inset 0 2px;
  }

  #workspaces button.urgent {
      background-color: #eb4d4b;
  }

  #mode {
      background-color: #64727D;
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
      color: #32cd32;
  }

  @keyframes blink {
      to {
          background-color: #ffffff;
          color: #000000;
      }
  }

  #battery.critical:not(.charging) {
      color: #f53c3c;
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
          background-color: rgba(235, 77, 75, 0.5);
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
      color: #eb4d4b;
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
      color: #2ecc71;
  }

  #memory {
      color: #ba55d3;
  }

  #disk {
      color: #964B00;
  }

  #backlight {
      color: #90b1b1;
  }

  #network {
      color: #00bfff;
  }

  #pulseaudio,
  #wireplumber {
      color: #f1c40f;
  }

  #temperature {
      color: #f0932b;
  }

  #mpd {
      color: #66cc99;
  }

  #mpd.paused {
      color: #51a37a;
  }

  #language {
      color: #00b093;
  }

  #keyboard-state {
      color: #97e1ad;
  }
''
