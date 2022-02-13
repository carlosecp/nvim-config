-- carlosecp's nvim config
-- https://github.com/carlosecp/dotfiles-nvim

-- Loads cached plugins
pcall(require, "impatient")

-- Sources core settings
require("carlosecp.autocmds")
require("carlosecp.keymappings")
require("carlosecp.options")

-- Load plugins
require("carlosecp.plugins")
pcall(require, "packer_compiled")

-- Activate LSP only when I want to.
-- vim.cmd("command LSP :lua require('carlosecp.lsp')")
require("carlosecp.lsp")
