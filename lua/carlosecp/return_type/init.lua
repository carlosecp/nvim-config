-- TODO: Would love to add some metadata to the return type, like
-- function name and stuff.
local utils = require("carlosecp.return_type.utils")

local M = {}

local langs = {
	go = { "function_definition", "function_declaration" }
}

M.get = function(bufnr, winnr)
	local bufnr, winnr, filetype = utils.setup_buffer()
	local tree_root = utils.get_tree_root(bufnr, filetype)
	local curr_node = utils.get_curr_node(winnr)

	local types = langs[filetype]
	-- filetype not supported.
	if types == nil then
		return
	end

	local parent_function = utils.get_parent_function(curr_node, types)
	local raw_str = utils.get_raw_return_type(parent_function, "result")

	local return_type_parser = utils.parsers[filetype]
	if return_type_parser == nil then
		return {}
	end

	return return_type_parser(raw_str)
end

return M
