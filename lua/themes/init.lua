local setup = {
	-- Nord.nvim: https://github.com/shaunsingh/nord.nvim
	nord = function()
		vim.g.nord_borders = true
		vim.cmd("colo nord")

		vim.cmd[[
		hi Mode guifg=#a3be8c guibg=#2e3440 gui=bold
		]]
	end,

	-- Nordbuddy: https://github.com/maaslalani/nordbuddy
	nordbuddy = function()
		vim.g.nord_italic = false
		vim.g.nord_italic_comments = false
		vim.cmd("colo nordbuddy")

		vim.cmd[[
		hi Mode guifg=#a3be8c guibg=#2e3440 gui=bold
		]]
	end
}

return function(colorscheme)
	setup[colorscheme]()
end
