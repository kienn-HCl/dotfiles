return {
	"hrsh7th/nvim-dansa",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local dansa = require("dansa")

		-- global settings.
		dansa.setup({
			-- The offset to specify how much lines to use.
			scan_offset = 100,

			-- The count for cut-off the indent candidate.
			cutoff_count = 5,

			-- The settings for tab-indentation or when it cannot be guessed.
			default = {
				expandtab = true,
				space = {
					shiftwidth = 2,
				},
				tab = {
					shiftwidth = 2,
				},
			},
		})

		-- per filetype settings.
		-- dansa.setup.filetype("nix", {
		--   space = {
		--     shiftwidth = 2,
		--   },
		--   default = {
		--     tab = {
		--       shiftwidth = 2,
		--     },
		--   },
		-- })
		-- dansa.setup.filetype("lua", {
		--   space = {
		--     shiftwidth = 2,
		--   },
		--   default = {
		--     tab = {
		--       shiftwidth = 2,
		--     },
		--   },
		-- })
	end,
}
