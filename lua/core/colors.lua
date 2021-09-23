return function(cs)
	if cs == "nord" then
		vim.g.nord_borders = true
		vim.cmd[[colorscheme nord]]
		vim.cmd[[
		hi CmpDocumentationBorder guifg=yellow
		]]
	end
end
