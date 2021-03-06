local status_ok_cmp, cmp = pcall(require, "cmp")

if not status_ok_cmp then return end

local compare  = cmp.config.compare
local utils    = require("core.utils")
local defaults = utils.defaults

vim.opt.pumheight = 15

local cmp_opts = {
	completion = {
		completeopt = "menuone,noselect",
	},
	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-f>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<CR>"]  = cmp.mapping.confirm({
			behaviour = cmp.ConfirmBehavior.Replace,
			select    = false
		}),
		["<C-Space>"] = cmp.mapping.complete()
	},
	sorting = {
		comparators = {
			compare.score,
			compare.scopes,
			compare.locality,
			compare.offset,
			compare.exact,
			compare.recently_used,
			compare.kind,
			compare.sort_text,
			compare.length,
			compare.order
		}
	},
	window = {
		completion = {
			border = defaults.borders
		},
		documentation = {
			border = defaults.borders,
			max_width = 50
		}
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip"  },
		{ name = "nvim_lua" },
		{ name = "path" },
		{
			name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end
			}
		},
		{ name = "nvim_lsp_signature_help" }
	},
	experimental = {
		ghost_text = true
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end
	}
}

local status_ok_lspkind, lspkind = pcall(require, "lspkind")

if status_ok_lspkind then
	cmp_opts["formatting"] = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 50,
			before = function(entrey, vim_item)
				return vim_item
			end
		})
	}
end

cmp.setup(cmp_opts)

--[[ local status_ok_autopairs, autopairs = pcall(require, "nvim-autopairs")
local status_ok_cmp_autopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

if status_ok_autopairs and status_ok_cmp_autopairs then
	autopairs.setup({})
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({
		map_char = { tex = "" }
	}))
end ]]
