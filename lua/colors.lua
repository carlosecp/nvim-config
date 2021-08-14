vim.opt.background = "dark"
vim.g.gruvbox_material_background = "medium"
vim.cmd("colorscheme gruvbox-material")

vim.cmd[[
" Terminal Highlight
highlight DarkTerm guibg=#1e1e1e

au TermOpen,TermEnter * setlocal nonu nornu
au TermOpen,TermEnter * setlocal winhl=Normal:DarkTerm,NormalNC:DarkTerm
au TermOpen,TermEnter * setlocal nocursorline
au TermOpen,TermEnter * setlocal winfixheight
]]
