local setup = {
	nord = function()
		vim.g.nord_borders = true
		vim.cmd("colo nord")
		require "themes.nord".setup()
	end,
	github = function()
	end
}

return function(colorscheme)
	setup[colorscheme]()
end
