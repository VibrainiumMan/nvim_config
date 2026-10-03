vim.g.mapleader = " "
vim.keymap.set("i", "(", "()<left>", { noremap = true })
vim.keymap.set("i", "[", "[]<left>", { noremap = true })
vim.keymap.set("i", "<", "<><left>", { noremap = true })
vim.keymap.set("i", '"', '""<left>', { noremap = true })
vim.keymap.set("i", "'", "''<left>", { noremap = true })
vim.keymap.set("i", "{<CR>", "{\n}<Esc>O", { noremap = true })
