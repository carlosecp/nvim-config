-- carlosecp's nvim config
-- https://github.com/carlosecp/dotfiles-nvim

-- Loads cached plugins
pcall("impatient")

-- Sources core settings
require("carlosecp.options")
require("carlosecp.keymappings")
require("carlosecp.autocmds")

-- Load plugins
require("carlosecp.plugins")
require("packer_compiled")
require("carlosecp.lsp")
