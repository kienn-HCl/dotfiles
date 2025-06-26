return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bufdelete = { enabled = true },
			explorer = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			scope = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
		keys = {
			{
				"<leader>/",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>b",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>sd",
				function()
					Snacks.picker.diagnostics_buffer()
				end,
				desc = "Diagnostics in buffers",
			},
			{
				"<leader>:",
				function()
					Snacks.picker.command_history()
				end,
				desc = "Command history",
			},
		},
	},
}
