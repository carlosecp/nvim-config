local M = {}

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

return M
