local cmp = require "cmp"
cmp.setup {
	completion = {
    completeopt = "menu,menuone,noinsert",
  },
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}
	},
	sources = {
		{ name = "buffer" },
		{ name = "nvim_lsp" },
		{ name = "path" }
	}
}

local function enableAutopairs()
	require "nvim-autopairs".setup()
	require "nvim-autopairs.completion.cmp".setup {
		map_cr = true,
		map_complete = true,
		auto_select = true
	}
end

enableAutopairs()

