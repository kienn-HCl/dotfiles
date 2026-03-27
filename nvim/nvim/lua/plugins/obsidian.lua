return {
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.opt.conceallevel = 1
			require("obsidian").setup({
				legacy_commands = false,
				workspaces = {
					{
						name = "default",
						path = "~/obsidian/default",
					},
				},
				daily_notes = {
					folder = "nikki",
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
