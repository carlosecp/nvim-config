require "github-theme".setup {
	themeStyle = "dark",
	darkSidebar = false
	-- transparent = true
}

vim.cmd[[
highlight DarkTerm guibg=#161b22

au TermOpen,TermEnter * setlocal nonu nornu
au TermOpen,TermEnter * setlocal winhl=Normal:DarkTerm,NormalNC:DarkTerm
au TermOpen,TermEnter * setlocal nocursorline 
au TermOpen,TermEnter * setlocal winfixheight
]]
