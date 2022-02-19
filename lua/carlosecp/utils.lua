_G.P = function(...)
	print(vim.inspect(...))
end

_G.RELOAD = function()
	local file_path = vim.fn.expand("%")
	local module = file_path:sub(7, string.len(file_path)-4)
	package.loaded[module] = nil
	require(module)
end
