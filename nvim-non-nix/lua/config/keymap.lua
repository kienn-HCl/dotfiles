vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<Down>", "gj")
vim.keymap.set("n", "<Up>", "gk")
vim.keymap.set("n", "gj", "j")
vim.keymap.set("n", "gk", "k")

-- escape
vim.keymap.set("i", "jj", "<Esc>", { silent = true })

-- search hilight off
vim.keymap.set("n", "<Esc><Esc>", ":nohl<CR>", { silent = true })
