return {
  {
    name = "nvim-treesitter",
    dir =  "${pkgs.vimPlugins.treesitter-plugin}",
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
