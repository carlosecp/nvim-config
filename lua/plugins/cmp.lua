local cmp = require "cmp"
cmp.setup {
	confirmation = { default_behaviour = cmp.ConfirmBehavior.Replace },
	documentation = {
		border    = "rounded",
		max_width = 80
	},
	mapping = {
		["<C-p>"]     = cmp.mapping.select_prev_item(),
		["<C-n>"]     = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"]      = cmp.mapping.confirm()
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				vsnip = "[vsnip]",
				nvim_lua = "[Lua]",
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
			return vim_item
		end
	},
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end
	}
}

-- Only use autopairs if enabled
if _G.plugins.autopairs then
	require "nvim-autopairs".setup()
	require "nvim-autopairs.completion.cmp".setup {
		map_cr       = true, --  map <CR> on insert mode
		map_complete = true, -- it will auto insert `(` after select function or method item
		auto_select  = true -- automatically select the first item
	}
end
