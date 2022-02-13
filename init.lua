-- carlosecp's nvim config
-- https://github.com/carlosecp/dotfiles-nvim

-- Loads cached plugins
pcall(require, "impatient")

-- Sources core settings
require("carlosecp.autocommands")
require("carlosecp.keymappings")
require("carlosecp.options")

-- Load plugins
require("carlosecp.plugins")
pcall(require, "packer_compiled")
require("carlosecp.lsp")

-- Custom plugins
-- Toggle terminal
require("carlosecp.terminal")
