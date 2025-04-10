{ pkgs, ... }:
{
  text = ''
    return {
      {
        name = "nvim-lspconfig",
        dir =  "${pkgs.vimPlugins.nvim-lspconfig}",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
          vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(_)
              vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)
              vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition)
              vim.keymap.set('n', '<leader>D', vim.lsp.buf.declaration)
              vim.keymap.set('n', 'K', vim.lsp.buf.hover)
              vim.keymap.set('n', '<leader>r', vim.lsp.buf.references)
              vim.keymap.set('n', '<leader>i', vim.lsp.buf.implementation)
              vim.keymap.set('n', '<leader>t', vim.lsp.buf.type_definition)
              vim.keymap.set('n', '<leader>n', vim.lsp.buf.rename)
              vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action)
              vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
              vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
              vim.keymap.set('n', '<leader>]', vim.diagnostic.goto_next)
              vim.keymap.set('n', '<leader>[', vim.diagnostic.goto_prev)
            end
          })

          local capabilities = require("cmp_nvim_lsp").default_capabilities()
          local lspconfig = require("lspconfig")
          for _, server in ipairs({
            "bashls",
            "clangd",
            "docker_compose_language_service",
            "dockerls",
            "gopls",
            "biome",
            "nil_ls",
            "openscad-lsp",
            "ruff",
            "rust_analyzer",
            "tinymist",
          }) do
            lspconfig[server].setup {
              capabilities = capabilities,
            }
          end
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          }
        end
      },
    }
  '';
}
