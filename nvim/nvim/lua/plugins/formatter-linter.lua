return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.hadolint,
          null_ls.builtins.formatting.nix_flake_fmt,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.shfmt,
        },
      })
    end
  },
}
