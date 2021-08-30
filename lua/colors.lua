vim.g.nord_borders  = true
vim.cmd[[colorscheme nord]]

-- Redefiningcolorscheme
vim.cmd[[
" Nord
hi! link NvimTreeEmptyFolderName NvimTreeFolderName
hi TSStringEscape guifg=#bf616a
]]

-- Terminal Autocmds
vim.cmd[[
" Terminal Settings
au TermOpen,TermEnter * setlocal nonu nornu
au TermOpen,TermEnter * setlocal nocursorline
au TermOpen,TermEnter * setlocal winfixheight

" LspSaga
hi LspFloatWinNormal guibg=NONE
]]

