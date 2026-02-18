return {
	{
		"stevearc/conform.nvim",
		event = { "VeryLazy" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				nix = { "nix_fmt" },
				sh = { "shfmt" },
				bash = { "shfmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		},
		config = function(_, opts)
			require("conform").setup(opts)
			vim.keymap.set("n", "<leader>cf", function()
				require("conform").format({ async = true })
			end, { desc = "Format buffer" })
		end,
	},
}
