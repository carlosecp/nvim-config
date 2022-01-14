local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
	return
end

local ts_utils = require "nvim-treesitter.ts_utils"

local get_current_node = function()
	local node = ts_utils.get_node_at_cursor()
	if not node then
		error("No treesitter parser available")
	end

	local parent = node:parent()
	-- root node for whole syntax tree
	local root = ts_utils.get_root_for_node(node)

	-- looking for the previous function
	local function_node = {
		"function_declaration",
		"method_declaration",
		"func_literal"
	}

	while (parent ~= root and parent ~= nil) do
		if function_node[node:type()] ~= nil then
			break
		end

		node = parent
		parent = node:parent()
	end

	return node
end

M = function()
	local current_node = get_current_node()
	local bufnr = vim.api.nvim_get_current_buf()
	ts_utils.update_selection(bufnr, current_node)
end

luasnip.snippets = {}
