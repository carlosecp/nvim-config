vim.cmd[[colorscheme github]]

-- Overriding Colorschemes
-- Colorscheme: Nord
-- vim.cmd[[
-- hi! link NvimTreeEmptyFolderName NvimTreeFolderName
-- hi TSStringEscape guifg=#bf616a
-- ]]

-- When using Native LSP
-- vim.cmd[[
-- " LspSaga
-- hi LspFloatWinNormal guibg=NONE
-- ]]

-- Autocmds
-- Toggle Terminal
vim.cmd[[
" Terminal Settings
au TermOpen,TermEnter * setlocal nonu nornu
au TermOpen,TermEnter * setlocal nocursorline
au TermOpen,TermEnter * setlocal winfixheight
]]

