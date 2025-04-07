{pkgs,...}:
{
  text = ''
-- Bootstrap lazy.nvim
local lazypath = "${pkgs.vimPlugins.lazy-nvim}"
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  -- checker = { enabled = true },
})
  '';
}
