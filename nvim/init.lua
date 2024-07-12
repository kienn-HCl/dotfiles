-- encoding
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'

-- visual
vim.o.ambiwidth = 'double'
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.visualbell = true
vim.o.number = true
vim.o.showmatch = true
vim.o.matchtime = 1

vim.o.cursorline = true
vim.o.list = true
vim.o.listchars = 'tab:»-,trail:-,nbsp:%,eol:↲'

-- search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':nohl<CR>', { noremap = true, silent = true })

-- manipulation
vim.g.mapleader = ' '
vim.opt.clipboard:append{'unnamedplus'}
vim.o.ttimeout = true
vim.o.ttimeoutlen = 50

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('cache') .. '/undo'

vim.o.helplang = 'ja','en'

vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', '<Up>', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', 'gj', 'j', { noremap = true })
vim.api.nvim_set_keymap('n', 'gk', 'k', { noremap = true })
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

require("config.lazy")
