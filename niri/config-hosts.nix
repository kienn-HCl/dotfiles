{ host, ... }:
''
  // Host-specific settings (managed by Nix)
  input {
      keyboard {
          xkb {
              layout "${host.input.xkb.keyboard.layout}"
              options "ctrl:nocaps,grp:shifts_toggle"
          }
      }
  }

  layout {
      default-column-width { proportion ${host.layout.default-column-width.proportion}; }
  }
''
