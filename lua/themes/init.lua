require "github-theme".setup {
	themeStyle = "dimmed"
}

vim.cmd[[
" Custom Highlight Groups
highlight StatusLineNC guifg=#6cb6ff guibg=#2d333b
highlight NvimTreeIndentMarker guifg=#2d333b

" Terminal Highlight
highlight DarkTerm guibg=#1e2228

au TermOpen,TermEnter * setlocal nonu nornu
au TermOpen,TermEnter * setlocal winhl=Normal:DarkTerm,NormalNC:DarkTerm
au TermOpen,TermEnter * setlocal nocursorline
au TermOpen,TermEnter * setlocal winfixheight
]]
