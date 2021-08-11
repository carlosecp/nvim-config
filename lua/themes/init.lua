require "github-theme".setup {
	themeStyle = "dimmed"
}

vim.cmd[[
" Custom Highlight Groups
highlight StatusLineNC guibg=#6cb6ff

" Terminal Highlight
highlight DarkTerm guibg=#1e2228

au TermOpen,TermEnter * setlocal nonu nornu
au TermOpen,TermEnter * setlocal winhl=Normal:DarkTerm,NormalNC:DarkTerm
au TermOpen,TermEnter * setlocal nocursorline
au TermOpen,TermEnter * setlocal winfixheight
]]
