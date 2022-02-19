local ts_utils = require("nvim-treesitter.ts_utils")

local node_is_function = function(node_type)
	function_types = { "function_definition", "function_declaration" }
	for _, valid_type in ipairs(function_types) do
		if node_type == valid_type then return true end
	end
	return false
end

local get_function_ret_type = function()
	parser = vim.treesitter.get_parser(vim.api.nvim_get_current_buf(), vim.bo.filetype)
	root = parser:parse()[1]:root()

	node = ts_utils.get_node_at_cursor(vim.api.nvim_get_current_win())

	while node:parent() ~= nil do
		if node_is_function(node:type()) then break end
		node = node:parent()
	end

	if node == root then return end

	local function inner_function()
		-- Testing this
		local variable = 0
	end

	child_nodes = node:field("result")
	print(vim.inspect(ts_utils.get_node_text(child_nodes[1])))

	ts_utils.update_selection(0, node)
end

_G.foo = get_function_ret_type
