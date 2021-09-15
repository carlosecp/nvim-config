local configs = {}

function configs.tokyonight()
	vim.cmd[[colorscheme tokyonight]]
end

return function(theme)
	configs[theme]()
end
