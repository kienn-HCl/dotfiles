return {
	{
		"nvim-treesitter/nvim-treesitter",
		cond = function()
			local ok, _ = pcall(require, "nvim-treesitter.configs")
			return not ok
		end,
		config = function()
			require("nvim-treesitter.configs").setup({
				sync_install = false,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = false },
			})
		end,
	},
}
