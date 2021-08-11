vim.g.background = "dark"
vim.cmd[[colorscheme gruvbox-material]]

vim.cmd[[
highlight DarkTerm guibg=#1e1e1e

au TermOpen,TermEnter * setlocal nonu nornu
au TermOpen,TermEnter * setlocal winhl=Normal:DarkTerm,NormalNC:DarkTerm
au TermOpen,TermEnter * setlocal nocursorline
au TermOpen,TermEnter * setlocal winfixheight
]]
