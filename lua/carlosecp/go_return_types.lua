local status_ok, ts_utils = pcall(require, "nvim-treesitter.ts_utils")
if not status_ok then return end

local M = {}

local get_bufnr = function(bufnr)
	return bufnr or vim.api.nvim_get_current_buf()
end

local get_winnr = function(winnr)
	return winnr or vim.api.nvim_get_current_win()
end

local node_is_function = function(node)
	local node_type = node:type()
	local function_types = { "function_definition", "function_declaration" }
	for _, valid_type in ipairs(function_types) do
		if node_type == valid_type then
			return true
		end
	end
	return false
end

-- Takes the raw function return types from a Go function and returns
-- which has a format like this: "(returnType1, returnType2, returnType3)"
-- and returns a table with the individual return types.
local parse_types_str = function(return_types_str)
	if return_types_str == nil then
		return {}
	end

	-- Remove the first parenthesis is there is one.
	local multiple_return_types = return_types_str:sub(1,1) == "("
	if multiple_return_types then
		local str_len = string.len(return_types_str)
		return_types_str = return_types_str:sub(2, str_len-1)
	end

	-- Trim the types after spliting the string.
	local trim = function(s)
		return (s:gsub("^%s*(.-)%s*$", "%1"))
	end

	local return_types = {}

	-- Split the original string and trim each type.
	for return_type in (return_types_str .. ","):gmatch("([^,]*),") do
		table.insert(return_types, trim(return_type))
	end

	return return_types
end

M.get_return_types = function(bufnr, winnr)
	local parser = vim.treesitter.get_parser(get_bufnr(bufnr), vim.bo.filetype)
	local root = parser:parse()[1]:root()
	local curr_node = ts_utils.get_node_at_cursor(get_winnr(winnr))

	while curr_node:parent() ~= nil do
		if node_is_function(curr_node) then
			break
		end
		curr_node = curr_node:parent()
	end

	-- If we reached to buffer's tree root then we were not inside a function.
	if curr_node == root then
		return
	end

	-- node:field() is not nil even if this node doesn't have children.
	local results_node = curr_node:field("result")

	-- return types is a table with a single value as a string. The format is
	-- the following: { "(returnType1, returnType2)" }, if there is only 1
	-- return type then the parenthesis are dropped.
	local return_types_str = ts_utils.get_node_text(results_node[1])[1]
	return parse_types_str(return_types_str)
end

-- For now this works:
-- lua print(vim.inspect(require("carlosecp.go_return_types").get_return_types()))

return M
