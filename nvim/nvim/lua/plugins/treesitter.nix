{ pkgs, ... }:
let
  inherit (pkgs.vimPlugins) nvim-treesitter;
  ts-all = pkgs.symlinkJoin {
    name = "ts-all";
    paths = [ nvim-treesitter ] ++ nvim-treesitter.withAllGrammars.dependencies;
  };
in
{
  text = ''
    return {
      {
        name = "nvim-treesitter",
        dir =  "${ts-all}",
        event = "BufRead",
        config = function()
          require("nvim-treesitter.configs").setup {
            sync_install = false,
            highlight = {
              enable = true,
              additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
          }
        end
      },
    }
  '';
}
