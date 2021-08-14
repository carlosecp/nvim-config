vim.cmd[[
" Terminal Highlight
highlight DarkTerm guibg=#1e1e1e
highlight StatusLineNC guifg=#6cb6ff guibg=#2d333b
highlight NvimTreeIndentMarker guifg=#47505d
highlight PmenuSel guifg=#2d333b guibg=#6cb6ff
highlight PmenuSBar guibg=#6cb6ff
highlight PmenuThumb guibg=#2d333b

au TermOpen,TermEnter * setlocal nonu nornu
au TermOpen,TermEnter * setlocal winhl=Normal:DarkTerm,NormalNC:DarkTerm
au TermOpen,TermEnter * setlocal nocursorline
au TermOpen,TermEnter * setlocal winfixheight
]]
