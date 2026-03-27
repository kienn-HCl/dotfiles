# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Nix home-manager configuration repository for managing user environment configuration declaratively. It uses Nix Flakes for dependency management.

## Commands

```bash
# Apply configuration changes
home-manager switch --impure

# Initial setup
nix run home-manager/master -- init --switch --impure

# Format code (uses treefmt with nixfmt for .nix, stylua for .lua)
nix fmt
```

## Architecture

### Module System

Each application has a dedicated directory with `default.nix` that defines the module. Modules are imported in `home.nix`. Configuration patterns include:

- **Direct config**: Simple programs using home-manager's `programs.*` options
- **Config file generation**: Complex configs generated from Nix (nvim generates Lua, niri generates KDL, waybar generates JSON/CSS)
- **Host-aware modules**: Some modules (niri, waybar) check hostname for different settings

### Key Files

- `flake.nix` - Flake inputs and outputs definition (flake-parts使用、`outputs = inputs:` パターン)
- `home.nix` - Main configuration, imports all modules
- `lib/user.nix` - ユーザー固有情報 (username, homeDirectory, git config)
- `lib/color/` - Kanagawa color scheme definitions shared across modules

### Configuration Languages

Modules generate various config formats from Nix:
- **nvim/**: Lua files via `xdg.configFile`
- **niri/**: KDL configuration
- **waybar/**: JSON config + CSS styling
- **Others**: TOML, shell scripts, CSS

### nixGL Wrapping

GPU-dependent applications use nixGL wrapper for non-NixOS systems. Look for `config.lib.nixGL.wrap` usage. nixGLはoverlayではなく`inputs.nixgl.packages`で直接参照している。

### Host Detection

Some modules branch on hostname:
```nix
if hostName == "yufuin" then ... else ...
```

## Design Decisions

- **overlayはなるべく避ける**: ビルド時間削減のため、可能であれば`inputs.foo.packages.${pkgs.system}.default`での直接参照を優先する

## Flake Inputs

Key dependencies: nixpkgs (unstable), home-manager, nixgl, firefox-nightly, nix-hazkey, ksk, romv
