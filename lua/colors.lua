vim.cmd[[colorscheme github]]

-- Colorscheme Autocmds
vim.cmd[[
" Terminal Highlight
au TermOpen,TermEnter * setlocal nonu nornu
au TermOpen,TermEnter * setlocal winhl=Normal:DarkTerm,NormalNC:DarkTerm
au TermOpen,TermEnter * setlocal nocursorline
au TermOpen,TermEnter * setlocal winfixheight
]]

