-- carlosecp's dotfiles-nvim
-- https://github.com/carlosecp/dotfiles-nvim

require("options")
require("mappings")
require("autocommands")
require("utils")

pcall(require, "impatient")
require("plugins")
require("lsp")
