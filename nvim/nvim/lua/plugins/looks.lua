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
    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    --     priority = 1000, -- make sure to load this before all the other start plugins
    --     config = function()
    --         -- load the colorscheme here
    --         vim.o.background = 'dark'
    --         vim.cmd([[colorscheme gruvbox]])
    --     end,
    -- },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            require('kanagawa').setup({
                background = {
                    dark = "dragon",
                    light = "lotus"
                },
            })
            vim.cmd([[colorscheme kanagawa]])
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            local function selectionCount()
                local mode = vim.fn.mode()
                local start_line, end_line, start_pos, end_pos

                -- 選択モードでない場合には無効
                if not (mode:find("[vV\22]") ~= nil) then return "" end

                start_line = vim.fn.line("v")
                end_line = vim.fn.line(".")
                if start_line > end_line then
                    local temp = start_line
                    start_line = end_line
                    end_line = temp
                end

                if mode == 'V' then
                    start_pos = 1
                    end_pos = vim.fn.strlen(vim.fn.getline(end_line)) + 1
                else
                    start_pos = vim.fn.col("v")
                    end_pos = vim.fn.col(".") + 1
                end

                local chars = 0
                for i = start_line, end_line do
                    local line = vim.fn.getline(i)
                    local line_len = vim.fn.strlen(line)
                    local s_pos = (i == start_line) and start_pos or 1
                    local e_pos = (i == end_line) and end_pos - 1 or line_len + 1
                    if s_pos > e_pos then
                        local temp = s_pos
                        s_pos = e_pos
                        e_pos = temp
                    end
                    chars = chars + vim.fn.strchars(line:sub(s_pos, e_pos))
                end

                local lines = math.abs(end_line - start_line) + 1
                return tostring(lines) .. " lines, " .. tostring(chars) .. " characters"
            end
            require("lualine").setup {
                options = {
                    section_separators = { left = '', right = '' },
                    component_separators = { left = ' ', right = '' },
                    colored = true
                },
                sections = {
                    lualine_c = {
                        'filename', 'lsp_progress'
                    },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_z = { selectionCount, 'location' },
                }
            }
        end,
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            vim.o.termguicolors = true
            vim.o.mousemoveevent = true
            vim.api.nvim_set_keymap('n', 'gb', ':BufferLinePick<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap('n', 'gB', ':BufferLinePickClose<CR>', { noremap = true, silent = true })
            require("bufferline").setup {
                options = {
                    separator_style = "slant",
                    numbers = "ordinal",
                    hover = {
                        enabled = true,
                        delay = 100,
                        reveal = { 'close' }
                    },
                    indicator = {
                        style = 'underline'
                    },
                    diagnostics = "nvim_lsp",
                }
            }
        end,
    },
}
