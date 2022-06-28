-- nvim-cmp
-- A completion plugin for neovim coded in Lua.
-- https://github.com/hrsh7th/nvim-cmp

local cmp = require("cmp")
local autopairs = require("nvim-autopairs")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local lspkind = require("lspkind")

vim.opt.completeopt = "menuone,noselect"

cmp.setup {
	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-f>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behaviour = cmp.ConfirmBehavior.Replace,
			select = false
		})
	},
	window = {
		completion = {
			border = _G.defaults.borders
		},
		documentation = {
			border = _G.defaults.borders,
			max_width = 50
			-- max_height = 50
		}
	},
	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{
			name = "buffer",
			option = {
				get_bufnrs = function()
					return vim.api.nvim_list_bufs()
				end
			}
		}
	},
	experimental = { ghost_text = true },
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 50,
			before = function(entrey, vim_item)
				return vim_item
			end
		})
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end
	}
}

autopairs.setup {}
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {
	map_char = { tex = "" }
})
