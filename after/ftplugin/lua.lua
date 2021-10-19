-- Settings
vim.opt.tabstop    = 2
vim.opt.shiftwidth = 2

local setup = require "modules.lsp".setup
setup("sumneko_lua", {})
