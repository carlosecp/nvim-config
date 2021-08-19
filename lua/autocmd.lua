-- Colorscheme Autocmds
vim.cmd[[
" Autocmd Highlight Groups
highlight DarkTerm guibg=#171717

" Terminal Highlight
au TermOpen,TermEnter * setlocal nonu nornu
au TermOpen,TermEnter * setlocal winhl=Normal:DarkTerm,NormalNC:DarkTerm
au TermOpen,TermEnter * setlocal nocursorline
au TermOpen,TermEnter * setlocal winfixheight
]]

-- Refresh NvimTreeLua on commit (term leave)
vim.cmd[[autocmd User TermClose <cmd>NvimTreeRefresh<CR>]]
