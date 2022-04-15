-- carlosecp's dotfiles-nvim
-- https://github.com/carlosecp/dotfiles-nvim
require("options")
require("mappings")
require("autocmds")

pcall(require, "impatient")
require("plugins")
require("lsp")
