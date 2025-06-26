return {
	{
		"monaqa/dps-dial.vim",
		dependencies = { "vim-denops/denops.vim" },
		event = "VeryLazy",
		keys = {
			{
				"<C-a>",
				mode = { "n", "x" },
				"<Plug>(dps-dial-increment)",
				desc = "カーソルの下または後の数字またはアルファベットに[count] を加える。",
			},
			{
				"<C-x>",
				mode = { "n", "x" },
				"<Plug>(dps-dial-decrement)",
				desc = "カーソルの下または後の数字またはアルファベットから[count] を減じる。",
			},
			{
				"g<C-a>",
				mode = { "n", "x" },
				"g<Plug>(dps-dial-increment)",
				desc = "カーソルの下または後の数字またはアルファベットに[count] を加える。",
			},
			{
				"g<C-x>",
				mode = { "n", "x" },
				"g<Plug>(dps-dial-decrement)",
				desc = "カーソルの下または後の数字またはアルファベットから[count] を減じる。",
			},
		},
		config = function()
			vim.g["dps_dial#augends"] = {
				"decimal",
				"date-slash",
			}
		end,
	},
}
