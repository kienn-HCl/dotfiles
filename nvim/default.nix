{ pkgs, ... }:
let
  treesitter-plugin = p: with p; [
    arduino
    bash
    c
    cmake
    cpp
    css
    dockerfile
    fsharp
    go
    haskell
    helm
    html
    hyprlang
    java
    lua
    make
    markdown
    markdown_inline
    nix
    python
    racket
    ruby
    rust
    scala
    scheme
    sway
    toml
    tsx
    typescript
    typst
    vim
    vimdoc
    yaml
  ];
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
  buildInputs = with pkgs; [deno];

  configFilePaths = pkgs.lib.filesystem.listFilesRecursive ./nvim;
  configAttr = map (path: { "${removePrefixPath ./. path}".text = builtins.readFile path; }) configFilePaths;
  configAttrs = pkgs.lib.attrsets.mergeAttrsList configAttr;
  removePrefixPath = base: path: pkgs.lib.strings.removePrefix (toString base + "/") (toString path);
in
  {
  xdg.configFile = configAttrs;
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;#.override { treesitter-parsers = {}; };
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
      (pkgs.vimPlugins.nvim-treesitter.withPlugins treesitter-plugin)
      denops-vim
    ];
    extraPackages = lsp ++ buildInputs;
  };
}
