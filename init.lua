-- carlosecp's nvim config
-- https://github.com/carlosecp/dotfiles-nvim

-- Loads cached plugins
pcall(require, "impatient")

-- Sources core settings
pcall(require, "carlosecp.autocmds")
pcall(require, "carlosecp.keymappings")
pcall(require, "carlosecp.options")

-- Load plugins
pcall(require, "carlosecp.plugins")
pcall(require, "packer_compiled")
pcall(require, "carlosecp.lsp")
