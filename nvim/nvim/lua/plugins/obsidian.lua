return {
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		-- ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		event = {
			-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
			-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
			-- refer to `:h file-pattern` for more examples
			"BufReadPre "
				.. vim.fn.expand("~")
				.. "/Documents/obsidian/*.md",
			"BufNewFile " .. vim.fn.expand("~") .. "/Documents/obsidian/*.md",
		},
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.opt.conceallevel = 1
			require("obsidian").setup({
				workspaces = {
					{
						name = "obsidian",
						path = "~/Documents/obsidian",
					},
				},
				daily_notes = {
					folder = "dailynote",
				},
				completion = {
					nvim_cmp = true,
				},
				note_id_func = function(title)
					if title == nil then
						title = tostring(os.time())
					end
					return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				end,
			})
		end,
	},
}
