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
			explorer = { enabled = false },
			picker = { enabled = true },
			notifier = { enabled = true },
			scope = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			toggle = { enabled = true },
			quickfile = { enabled = true },
		},
		config = function(_, opts)
			require("snacks").setup(opts)
			vim.keymap.set("n", "<leader>/", function()
				Snacks.picker.grep()
			end, { desc = "Grep" })
			vim.keymap.set("n", "<leader>b", function()
				Snacks.picker.buffers()
			end, { desc = "Buffers" })
			vim.keymap.set("n", "<leader>sd", function()
				Snacks.picker.diagnostics_buffer()
			end, { desc = "Diagnostics in buffers" })
			vim.keymap.set("n", "<leader>:", function()
				Snacks.picker.command_history()
			end, { desc = "Command history" })
			vim.keymap.set("n", "<leader>ud", function()
				Snacks.toggle.diagnostics():toggle()
			end, { desc = "Toggle diagnostics" })
			vim.keymap.set("n", "<leader>ul", function()
				Snacks.toggle.line_number():toggle()
			end, { desc = "Toggle line numbers" })
			vim.keymap.set("n", "<leader>uw", function()
				Snacks.toggle.option("wrap"):toggle()
			end, { desc = "Toggle word wrap" })
		end,
	},
}
