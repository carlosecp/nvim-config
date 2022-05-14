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

function M.map(mode, keys, command, opt)
    local options = { silent = true }

    if opt then
	options = vim.tbl_deep_extend("force", options, opt)
    end

    if type(keys) == table then
	for _, keymap in ipairs(keys) do
	    M.map(mode, keymap, command, opt)
	end
    end

    vim.keymap.set(mode, keys, command, opt)
end

_G.P = function(...)
    vim.pretty_print(...)
end

return M
