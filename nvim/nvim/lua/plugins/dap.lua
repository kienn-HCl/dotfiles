return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Python (debugpy)
			dap.adapters.python = function(cb, config)
				cb({
					type = "executable",
					command = "python",
					args = { "-m", "debugpy.adapter" },
				})
			end

			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch file",
					program = "${file}",
				},
			}

			dapui.setup()
			require("nvim-dap-virtual-text").setup()

			-- Auto open/close UI
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			-- Keybindings
			vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
			vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Continue" })
			vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "Step into" })
			vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "Step over" })
			vim.keymap.set("n", "<Leader>dO", dap.step_out, { desc = "Step out" })
			vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "Open REPL" })
			vim.keymap.set("n", "<Leader>du", dapui.toggle, { desc = "Toggle UI" })
		end,
	},
}
