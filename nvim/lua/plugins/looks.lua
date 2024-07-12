return {
--     {
--         "folke/tokyonight.nvim",
--         lazy = false, -- make sure we load this during startup if it is your main colorscheme
--         priority = 1000, -- make sure to load this before all the other start plugins
--         config = function()
--         -- load the colorscheme here
--         vim.cmd([[colorscheme tokyonight]])
--         end,
--     },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.o.background = 'dark'
            vim.cmd([[colorscheme gruvbox]])
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                section_separators = { left = '', right = ''},
                component_separators = { left = ' ', right = '' },
                colored=true
            },
            sections = {
                lualine_c = {
                    'filename','lsp_progress'
                },
                lualine_z = { 'location' }
            }
        }
    }
}
