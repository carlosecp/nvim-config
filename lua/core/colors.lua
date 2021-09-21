return function(cs)
	if cs == "nord" then
		vim.g.nord_borders = true
		vim.cmd[[colorscheme nord]]
		vim.cmd[[
		hi VimMode guibg=#d8dee9
		]]
	end
end
