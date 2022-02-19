local status_ok, ts_utils = pcall(require, "nvim-treesitter.ts_utils")
if not status_ok then
	return
end

local M = {}

M.setup_buffer = function()
	local bufnr = vim.api.nvim_get_current_buf()
	local winnr = vim.api.nvim_get_current_win()
	local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
	return bufnr, winnr, filetype
end

M.get_tree_root = function(bufnr, filetype)
	local parser = vim.treesitter.get_parser(bufnr, filetype)
	return parser:parse()[1]:root()
end

M.get_curr_node = function(winnr)
	return ts_utils.get_node_at_cursor(winnr)
end

local node_is_of_type = function(node, types)
	local node_type = node:type()
	for _, t in ipairs(types) do
		if node_type == t then
			return true
		end
	end
	return false
end

M.get_parent_function = function(node, types)
	while node:parent() do
		if node_is_of_type(node, types) then
			break
		end
		node = node:parent()
	end
	return node
end

M.get_raw_return_type = function(function_node, field)
	local function_return_node = function_node:field(field)
	return ts_utils.get_node_text(function_return_node[1])[1]
end

M.parsers = {
	go = function(raw_str)
		local return_types = {}

		-- If a Go function returns multiple values it's return type signature is
		-- a tuple with the following format: "(type1, type2, type3, ..., typeN)".
		-- Otherwise we will have a single string "type" or no string at all.
		-- local is_tuple = string.find(raw_str, "(")
		local is_tuple = true

		if is_tuple then
			local len = string.len(raw_str)
			-- Get rid of the parenthesis.
			raw_str = raw_str:sub(2, len-1)
		end

		for t in (" " .. raw_str .. ","):gmatch(" ([^,]*),") do
			table.insert(return_types, t)
		end

		return return_types
	end
}

return M
