-- carlosecp's dotfiles-nvim
-- https://github.com/carlosecp/dotfiles-nvim

require("options")
require("mappings")
require("autocmds")
require("utils")

pcall(require, "impatient")
require("plugins")
require("lsp")
