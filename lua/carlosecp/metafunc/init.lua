-- Gets the return type of the parent function of the current node, alongside
-- some additional metadata that can be used for creating snippets, etc.
local utils = require("carlosecp.metafunc.utils")

local M = {}

-- Sets metatable for langs setup values.
local set_langs_default = function(t)
	local mt = {
		__index = function()
			return {
				func_name = "name",
				func_type = "result", -- Return types
				func_block = { "function_definition", "function_declaration" }
			}
		end
	}

	setmetatable(t, mt)
end

-- Indentifiers for TS nodes. For example, in Go a function return types are identified
-- by a node called "result" while in Rust its a node called "return_type".
local langs = {
	go = {
		func_name = "name",
		func_type = "result",
		func_block = { "function_definition", "function_declaration" }
	},
	rust = {
		func_name = "name",
		func_type = "return_type",
		func_block = { "function_item" }
	}
}

set_langs_default(langs)

M.get = function(bufnr, winnr)
	local bufnr, winnr, filetype = utils.setup_buffer()
	local tree_root = utils.get_tree_root(bufnr, filetype)
	local curr_node = utils.get_curr_node(winnr)

	local opts = langs[filetype]
	-- if filetype not supported...
	if opts == nil then
		return {}
	end

	-- Parent function of the current node.
	local parent_func = utils.get_parent_func(curr_node, opts.func_block)
	-- Raw string representing the function's return type.
	local raw_type_str = utils.get_func_field(parent_func, opts.func_type)
	local func_name = utils.get_func_field(parent_func, "name")

	-- Different parsers may change the way they output a function's return
	-- type information, so there are parsers for different kind of outputs.
	local parser = utils.parsers[filetype]
	if parser == nil then
		return {}
	end

	return {
		func_name = func_name,
		func_type = parser(raw_type_str)
	}
end

-- Just for fun
M.debug = function()
	local status_ok, ts_utils = pcall(require, "nvim-treesitter.ts_utils")
	if not status_ok then
		return
	end

	local bufnr, winnr, filetype = utils.setup_buffer()
	local tree_root = utils.get_tree_root(bufnr, filetype)
	local curr_node = utils.get_curr_node(winnr)
	local parent_func = utils.get_parent_func(curr_node, langs[filetype].func_block)

	ts_utils.update_selection(bufnr, parent_func)
end

return M
