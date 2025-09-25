{ host, ... }:
''
  // https://github.com/YaLTeR/niri/wiki/Configuration:-Input
  input {
    keyboard {
        xkb {
            // For more information, see xkeyboard-config(7).
            layout "${host.input.xkb.keyboard.layout}"
            options "ctrl:nocaps,grp:shifts_toggle"
        }
    }

    touchpad {
        // off
        tap
        // dwt
        // dwtp
        // natural-scroll
        // accel-speed 0.2
        // accel-profile "flat"
        // scroll-method "two-finger"
        // disabled-on-external-mouse
    }

    mouse {
        // off
        // natural-scroll
        // accel-speed 0.2
        // accel-profile "flat"
        // scroll-method "no-scroll"
    }

    trackpoint {
        // off
        // natural-scroll
        // accel-speed 0.2
        // accel-profile "flat"
        // scroll-method "on-button-down"
        // scroll-button 273
        // middle-emulation
    }

    // Uncomment this to make the mouse warp to the center of newly focused windows.
    warp-mouse-to-focus

    // Focus windows and outputs automatically when moving the mouse into them.
    // Setting max-scroll-amount="0%" makes it work only on windows already fully on screen.
    focus-follows-mouse max-scroll-amount="0%"
  }

  // https://github.com/YaLTeR/niri/wiki/Configuration:-Layout
  layout {
      // Set gaps around windows in logical pixels.
      gaps 20

      // When to center a column when changing focus, options are:
      // - "never", default behavior, focusing an off-screen column will keep at the left
      //   or right edge of the screen.
      // - "always", the focused column will always be centered.
      // - "on-overflow", focusing a column will center it if it doesn't fit
      //   together with the previously focused column.
      center-focused-column "never"

      // You can customize the widths that "switch-preset-column-width" (Mod+R) toggles between.
      preset-column-widths {
          proportion 0.33333
          proportion 0.5
          proportion 0.66667
          proportion 1.0

          // Fixed sets the width in logical pixels exactly.
          // fixed 1920
      }

      // You can also customize the heights that "switch-preset-window-height" (Mod+Shift+R) toggles between.
      preset-window-heights {
          proportion 0.33333
          proportion 0.5
          proportion 0.66667
          proportion 1.0
      }

      // You can change the default width of the new windows.
      // If you leave the brackets empty, the windows themselves will decide their initial width.
      default-column-width { proportion ${host.layout.default-column-width.proportion}; }

      // By default focus ring and border are rendered as a solid background rectangle
      // behind windows. That is, they will show up through semitransparent windows.
      // This is because windows using client-side decorations can have an arbitrary shape.
      //
      // If you don't like that, you should uncomment `prefer-no-csd` below.
      // Niri will draw focus ring and border *around* windows that agree to omit their
      // client-side decorations.
      //
      // Alternatively, you can override it with a window rule called
      // `draw-border-with-background`.

      // You can change how the focus ring looks.
      focus-ring {
          // off

          // How many logical pixels the ring extends out from the windows.
          width 4

          // Colors can be set in a variety of ways:
          // - CSS named colors: "red"
          // - RGB hex: "#rgb", "#rgba", "#rrggbb", "#rrggbbaa"
          // - CSS-like notation: "rgb(255, 127, 0)", rgba(), hsl() and a few others.

          active-color "#98971a"
          inactive-color "#a89984"

          // active-gradient from="#80c8ff" to="#bbddff" angle=45
          // inactive-gradient from="#505050" to="#808080" angle=45 relative-to="workspace-view"
      }

      // You can also add a border. It's similar to the focus ring, but always visible.
      border {
          // The settings are the same as for the focus ring.
          off

          width 4
          active-color "#ffc87f"
          inactive-color "#505050"

          // active-gradient from="#ffbb66" to="#ffc880" angle=45 relative-to="workspace-view"
          // inactive-gradient from="#505050" to="#808080" angle=45 relative-to="workspace-view"
      }

      // Struts shrink the area occupied by windows, similarly to layer-shell panels.
      // You can think of them as a kind of outer gaps. They are set in logical pixels.
      // Left and right struts will cause the next window to the side to always be visible.
      // Top and bottom struts will simply add outer gaps in addition to the area occupied by
      // layer-shell panels and regular gaps.
      struts {
          left 8
          right 8
          // top 64
          // bottom 64
      }
      tab-indicator {
          width 15
          gap 8
          length total-proportion=0.5
          gaps-between-tabs 8
          corner-radius 10
          position "left"
          place-within-column
      }
  }

''
