{ pkgs, config, ... }:
let
  lsp = with pkgs; [
    # shell
    shellcheck
    bash-language-server
    shfmt
    # c
    llvmPackages_19.clang-tools
    # docker
    dockerfile-language-server-nodejs
    docker-compose-language-service
    hadolint
    # go
    gopls
    # js
    biome
    # lua
    lua-language-server
    stylua
    # nix
    nil
    # openscad
    openscad-lsp
    # python
    ruff
    # rust
    rust-analyzer
    # typst
    tinymist
  ];
  buildInputs = with pkgs; [ deno ];

  inherit (pkgs.lib) strings filesystem attrsets;
  configPaths = map toString (filesystem.listFilesRecursive ./nvim);
  luaConfigPaths = builtins.filter (f: strings.hasSuffix ".lua" f) configPaths;
  luaConfigAttrs = map (path: {
    "${strings.removePrefix (toString ./. + "/") path}".source =  path;
  }) luaConfigPaths;
  luaConfigAttr = attrsets.mergeAttrsList luaConfigAttrs;

  nixConfigPaths = builtins.filter (f: strings.hasSuffix ".nix" (toString f)) configPaths;
  nixConfigAttrs = map (path: {
    "${strings.removeSuffix ".nix" (removePrefixPath ./. path) + ".lua"}".text =
      (import path { inherit pkgs; }).text;
  }) nixConfigPaths;
  nixConfigAttr = attrsets.mergeAttrsList nixConfigAttrs;
  removePrefixPath = base: path: strings.removePrefix (toString base + "/") (toString path); in
{
  xdg.configFile = luaConfigAttr // nixConfigAttr;
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped; # .override { treesitter-parsers = {}; };
    defaultEditor = true;
    extraPackages = lsp ++ buildInputs;
  };
}
