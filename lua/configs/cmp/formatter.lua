-- Formatter for completion option/entries.

return function(entry, vim_item)
	vim_item.menu = ({
		nvim_lsp      = "[LSP]",
		buffer        = "[Buffer]",
		nvim_lua      = "[Lua]",
		luasnip       = "[luasnip]",
		latex_symbols = "[Latex]",
	})[entry.source.name]
	vim_item.kind = ({
		Text          = " Text",
		Method        = " Method",
		Function      = " Function",
		Constructor   = " Constructor",
		Field         = " Field",
		Variable      = " Variable",
		Class         = " Class",
		Interface     = "ﰮ Interface",
		Module        = " Module",
		Property      = " Property",
		Unit          = " Unit",
		Value         = " Value",
		Enum          = " Enum",
		Keyword       = " Keyword",
		Snippet       = "﬌ Snippet",
		Color         = " Color",
		File          = " File",
		Reference     = " Reference",
		Folder        = " Folder",
		EnumMember    = " EnumMember",
		Constant      = " Constant",
		Struct        = " Struct",
		Event         = " Event",
		Operator      = "ﬦ Operator",
		TypeParameter = " TypeParameter",
	})[vim_item.kind]

	-- Limit item with to 50 characters
	local maxwidth = 50
	if string.len(vim_item.abbr) >= maxwidth then
		vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth - 3)
		vim_item.abbr = vim_item.abbr .. "..."
	end

	return vim_item
end