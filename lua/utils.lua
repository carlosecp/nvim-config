_G.P = function(...)
	vim.pretty_print(...)
end

_G.R = function(module)
	module = module == nil and vim.fn.expand("%") or module
	_, module = module:match("(.*)lua/(.+).lua")
	module = module:match("(.*)/init") or module

	package.loaded[module] = nil
	require(module)
	print(string.format("loaded[%s]", module))
end

local M = {
	borders = "rounded"
}

return M
