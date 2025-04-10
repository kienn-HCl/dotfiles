{ pkgs, ... }:
{
  text = ''
    return {
      {
        "vim-skk/skkeleton",
        dependencies = { "vim-denops/denops.vim", "rinx/cmp-skkeleton" },
        event = "VeryLazy",
        keys = {
          { "<C-j>", mode = { "i", "c", "t" }, "<Plug>(skkeleton-toggle)", desc = "Toggle skkeleton" },
        },
        config = function()
          vim.fn["skkeleton#config"] {
            globalDictionaries = {
              { '${pkgs.skkDictionaries.l}/share/skk/SKK-JISYO.L',                   'euc-jp' },
              { '${pkgs.skkDictionaries.jinmei}/share/skk/SKK-JISYO.jinmei',         'euc-jp' },
              { '${pkgs.skkDictionaries.geo}/share/skk/SKK-JISYO.geo',               'euc-jp' },
              { '${pkgs.skkDictionaries.propernoun}/share/skk/SKK-JISYO.propernoun', 'euc-jp' },
              { '${pkgs.skkDictionaries.station}/share/skk/SKK-JISYO.station',       'euc-jp' },
              { '${pkgs.skkDictionaries.okinawa}/share/skk/SKK-JISYO.okinawa',       'euc-jp' },
            }
          }
        end,
      },
    }
  '';
}
