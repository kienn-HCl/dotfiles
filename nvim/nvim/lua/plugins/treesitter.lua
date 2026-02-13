return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		event = "BufRead",
		config = function()
			-- main branchではクエリがruntime/queries/にあるため、rtpに追加
			local plugin_path = vim.fn.stdpath("data") .. "/lazy/nvim-treesitter"
			vim.opt.rtp:prepend(plugin_path .. "/runtime")

			require("nvim-treesitter").setup({})
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
				callback = function(ctx)
					pcall(vim.treesitter.start)
				end,
			})
		end,
	},
	{
		"RRethy/nvim-treesitter-endwise",
	},
}
