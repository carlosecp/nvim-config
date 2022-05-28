-- carlosecp's dotfiles-nvim
-- https://github.com/carlosecp/dotfiles-nvim

require("core.options")
require("core.mappings")
require("core.autocmds")
require("core.utils")

pcall(require, "impatient")
require("plugins")
require("plugins.lsp")
