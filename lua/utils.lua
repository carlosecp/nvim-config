_G.P = function(...)
	print(vim.inspect(...))
end

_G.R = function(module)
	package.loaded[module] = nil
	require(module)
end
