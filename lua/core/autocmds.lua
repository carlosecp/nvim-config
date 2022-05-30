local function create_augroup(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Filetype Associtions {{{
local ft_associations_augroup = create_augroup("FileTypeAssocations")
local associate_fts = function(pattern, filetype)
	vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = pattern,
		callback = function()
			vim.shedule(function()
				vim.bo.filetype = filetype
			end)
		end,
		group = ft_associations_augroup
	})
end

-- Take .prettierc file as regular JSON
associate_fts(".prettierc", "json")
-- Take multiple UML extensions just as regular UML
associate_fts({ "*.pu", "*.uml", "*.puml", "*.iuml", "*.plantuml" }, "uml")
-- }}}

-- Parse Treesitter AST Symbols for Winbar {{{
local parse_ast_symbols = function(symbols_tbl)
	local result = ""
	local sep = " > "
	for i, symbol in pairs(symbols_tbl) do
		result = string.format("%s%s%s %s", result, sep, symbol.icon, symbol.name)
	end
	return result
end

local get_filename = function()
	local filename = vim.api.nvim_buf_get_name(0)
	local t = {}
	for str in string.gmatch(filename, "([^/]+)") do
		table.insert(t, str)
	end
	return t[#t]
end

local winbar_fmt = function()
	local filename = get_filename()
	local ast_symbols = require("aerial").get_location()
	if vim.tbl_isempty(ast_symbols) then return filename end
	return filename .. parse_ast_symbols(ast_symbols)
end

vim.api.nvim_create_autocmd({ "CursorMoved", "BufWinEnter", "BufFilePost" }, {
	 callback = function()
    local excluded_fts = {
			"Prompt",
			"startuptime",
			"TelescopePrompt",
			"TelescopeResults",
      "alpha",
      "help",
      "NvimTree",
      "packer"
    }

    if vim.tbl_contains(excluded_fts, vim.bo.filetype) then
      vim.opt_local.winbar = nil
      return
    end

    vim.opt_local.winbar = winbar_fmt()
  end
})
-- }}}
