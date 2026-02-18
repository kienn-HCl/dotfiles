return {
	{
		"monaqa/dps-dial.vim",
		dependencies = { "vim-denops/denops.vim" },
		event = "VeryLazy",
		config = function()
			vim.g["dps_dial#augends"] = {
				"decimal",
				"date-slash",
			}
			vim.keymap.set({ "n", "x" }, "<C-a>", "<Plug>(dps-dial-increment)", { desc = "Increment" })
			vim.keymap.set({ "n", "x" }, "<C-x>", "<Plug>(dps-dial-decrement)", { desc = "Decrement" })
			vim.keymap.set({ "n", "x" }, "g<C-a>", "g<Plug>(dps-dial-increment)", { desc = "Increment (multi-line)" })
			vim.keymap.set({ "n", "x" }, "g<C-x>", "g<Plug>(dps-dial-decrement)", { desc = "Decrement (multi-line)" })
		end,
	},
}
