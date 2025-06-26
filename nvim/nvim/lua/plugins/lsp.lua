return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(_)
					vim.keymap.set("n", "<leader>fb", vim.lsp.buf.format)
					vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition)
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.declaration)
					vim.keymap.set("n", "K", vim.lsp.buf.hover)
					vim.keymap.set("n", "<leader>r", vim.lsp.buf.references)
					vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation)
					vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition)
					vim.keymap.set("n", "<leader>n", vim.lsp.buf.rename)
					vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
					vim.keymap.set("n", "<space>le", vim.diagnostic.open_float)
					vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
				end,
			})

			vim.diagnostic.config({ virtual_text = true })

			vim.lsp.config("*", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})
			vim.lsp.config("lua_ls", {
				filetypes = { "lua" },
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
			vim.lsp.enable({
				"bashls",
				"biome",
				"clangd",
				"docker_compose_language_service",
				"dockerls",
				"fsautocomplete",
				"gopls",
				"lua_ls",
				"nil_ls",
				"openscad_lsp",
				"pylsp",
				"ruff",
				"rust_analyzer",
				"tinymist",
			})
		end,
	},
}
