-- aerial.nvim
-- Neovim plugin for a code outline window.
-- https://github.com/stevearc/aerial.nvim

local aerial = require("aerial")
aerial.setup {
	backends = { "treesitter", "lsp" }
}
