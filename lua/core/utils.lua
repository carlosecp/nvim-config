function _G.R(module)
	module = module == nil and vim.fn.expand("%") or module
	_, module = module:match("(.*)lua/(.+).lua")
	module = module:match("(.*)/init") or module

	package.loaded[module] = nil
	require(module)
	print(string.format("loaded[%s]", module))
end

function _G.P(...)
	vim.pretty_print(...)
end

function _G.diag()
	if not vim.g.diagnostics_active then
		vim.diagnostic.show()
	else
		vim.diagnostic.hide()
	end
end

local M = {}

M.defaults = {
	borders = "none",
	mappings = {
		rename = "<Leader>rn"
	}
}

function M.map(mode, keys, command, opt)
	local options = { 
		noremap = true,
		silent = true
	}

	if opt then
		options = vim.tbl_deep_extend("force", options, opt)
	end

	if type(keys) == table then
		for _, keymap in ipairs(keys) do
			M.map(mode, keymap, command, opt)
		end
	end

	vim.keymap.set(mode, keys, command, options)
end

function M.localmap(mode, keys, command, opt)
	local options = {
		buffer = true
	}

	if opt then
		options = vim.tbl_deep_extend("force", options, opt)
	end

	M.map(mode, keys, command, options)
end

return M
