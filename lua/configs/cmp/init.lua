-- nvim-cmp
-- A completion plugin for neovim coded in Lua.
-- https://github.com/hrsh7th/nvim-cmp

local cmp = require "cmp"
local autopairs = require "nvim-autopairs"
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local formatter = require "configs.cmp.formatter"
local utils = require "utils"

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-f>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behaviour = cmp.ConfirmBehavior.Insert,
			select = false
		})
	}),
	window = {
		completion = {
			border = utils.borders
		},
		documentation = {
			border = utils.borders,
			max_width = 50,
			-- max_height = 50
		}
	},
	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer" }
	},
	experimental = { ghost_text = true },
	formatting = { format = formatter },
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	}
})

autopairs.setup({})
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({
	map_char = { tex = "" }
}))
