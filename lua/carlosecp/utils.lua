_G.P = function(...)
	print(vim.inspect(...))
end

_G.R = function(module)
	module = "carlosecp." .. module
	package.loaded[module] = nil
	require(module)
end
