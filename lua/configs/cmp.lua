local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then return end

local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then return end

cmp.setup({
	confirmation = {
		default_behaviour = cmp.ConfirmBehavior.Replace
	},
	completion = {
		completeopt = "menu,menuone,noinsert,noselect"
	},
	documentation = {
		border    = _G.carlosecp.border,
		max_width = 80
	},
	mapping = {
		["<C-p>"]     = cmp.mapping.select_prev_item(),
		["<C-n>"]     = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"]      = cmp.mapping.confirm()
	},
	sources = {
		{ name = "luasnip"  },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "path"     },
		{ name = "buffer", keyword_length = 1 },
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.menu = ({
				nvim_lsp      = "[LSP]",
				buffer        = "[Buffer]",
				nvim_lua      = "[Lua]",
				vsnip         = "[vsnip]",
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
			luasnip.lsp_expand(args.body)
		end
	},
	experimental = {
		ghost_text = true
	}
})
