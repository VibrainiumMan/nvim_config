--BG
vim.cmd("highlight Normal guibg=#191D21 guifg=#cdd6f4")

--Line num
vim.cmd("highlight CursorLineNr guifg=#d60909")

--PreProc
vim.cmd("highligh PreProc guifg=#1c88ff")

--Type
vim.cmd("highlight Type guifg=#ff620f")

--String
vim.cmd("highlight String guifg=#11d902")

--Functions
vim.cmd("highlight Function guifg=#1c88ff")

--Statement
vim.cmd("highlight Statement guifg=#f21ff2")

--Constants
vim.cmd("highlight Constant guifg=#c200fa")

vim.api.nvim_set_hl(0, "@parameter", { fg = "#5de2fc" })
