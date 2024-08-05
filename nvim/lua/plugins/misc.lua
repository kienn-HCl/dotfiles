return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require('which-key').setup({
                delay = function(ctx)
                    return ctx.plugin and 0 or 1000
                end,
            })
            require('which-key').add({
                {
                    mode = { "i" },
                    { "<C-x><C-]>", desc = "tags" },
                    { "<C-x><C-d>", desc = "definitions or macros" },
                    { "<C-x><C-f>", desc = "file names" },
                    { "<C-x><C-i>", desc = "keywords in the current and included files" },
                    { "<C-x><C-k>", desc = "keywords in dictionary" },
                    { "<C-x><C-l>", desc = "Whole lines" },
                    { "<C-x><C-n>", desc = "keywords in the current file" },
                    { "<C-x><C-o>", desc = "omni completion" },
                    { "<C-x><C-s>", desc = "Spelling suggestions" },
                    { "<C-x><C-t>", desc = "keywords in thesaurus" },
                    { "<C-x><C-u>", desc = "User defined completion" },
                    { "<C-x><C-v>", desc = "Vim command-line" },
                    { "<C-x><C-z>", desc = "stop completion" },
                },
            })
        end
    },
    {
        "stevearc/oil.nvim",
        config = function()
            vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
            require('oil').setup()
        end,
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "machakann/vim-sandwich",
        config = function()
            vim.g["sandwich#recipes"] = vim.list_extend(vim.deepcopy(vim.g["sandwich#default_recipes"]),{})
        end,
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                search = { enabled = true }
            }
        },
        keys = {
            { "ss", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },
    {
        "vim-skk/skkeleton",
        dependencies = { "vim-denops/denops.vim","rinx/cmp-skkeleton"  },
        keys = {
            { "<C-j>", mode = { "i", "c", "t" }, "<Plug>(skkeleton-toggle)" , desc = "Toggle skkeleton" },
        },
        config = function()
            vim.fn["skkeleton#config"]{
                globalDictionaries = {
                    {'/usr/share/skk/SKK-JISYO.L', 'euc-jp'},
                    {'/usr/share/skk/SKK-JISYO.jinmei', 'euc-jp'},
                    {'/usr/share/skk/SKK-JISYO.geo', 'euc-jp'},
                    {'/usr/share/skk/SKK-JISYO.propernoun', 'euc-jp'},
                    {'/usr/share/skk/SKK-JISYO.station', 'euc-jp'},
                    {'/usr/share/skk/SKK-JISYO.okinawa', 'euc-jp'},
                }
            }
        end,
    },
    {
        "vim-jp/vimdoc-ja"
    },
    {
        "monaqa/dps-dial.vim",
        dependencies = { "vim-denops/denops.vim" },
        event = "VeryLazy",
        keys = {
            { "<C-a>", mode = { "n", "x" }, "<Plug>(dps-dial-increment)" , desc = "カーソルの下または後の数字またはアルファベットに[count] を加える。" },
            { "<C-x>", mode = { "n", "x" }, "<Plug>(dps-dial-decrement)" , desc = "カーソルの下または後の数字またはアルファベットから[count] を減じる。" },
            { "g<C-a>", mode = { "n", "x" }, "g<Plug>(dps-dial-increment)" , desc = "カーソルの下または後の数字またはアルファベットに[count] を加える。" },
            { "g<C-x>", mode = { "n", "x" }, "g<Plug>(dps-dial-decrement)" , desc = "カーソルの下または後の数字またはアルファベットから[count] を減じる。" },
        },
    },
    {
        "RRethy/vim-illuminate",
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
}
