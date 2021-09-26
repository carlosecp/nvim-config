local setup = {
	-- Nord (Official): https://github.com/arcticicestudio/nord-vim
	["nord"]= function()
		vim.cmd("colo nord")

		vim.cmd[[
		hi Mode guifg=#a3be8c guibg=#2e3440
		]]
	end,

	-- Nord.nvim: https://github.com/shaunsingh/nord.nvim
	["nord.nvim"] = function()
		vim.g.nord_borders = true
		vim.cmd("colo nord")

		vim.cmd[[
		hi Mode guifg=#a3be8c guibg=#2e3440
		]]
	end,

	-- Nordbuddy: https://github.com/maaslalani/nordbuddy
	["nordbuddy"] = function()
		vim.g.nord_italic = false
		vim.g.nord_italic_comments = false
		vim.cmd("colo nordbuddy")

		vim.cmd[[
		hi Mode guifg=#a3be8c guibg=#2e3440
		]]
	end
}

return function(colorscheme)
	setup[colorscheme]()
end
