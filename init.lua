-- carlosecp's dotfiles-nvim
-- https://github.com/carlosecp/dotfiles-nvim

require "core.options"
require "core.mappings"
require "autocommands"
require "utils"

pcall(require, "impatient")
require "plugins"
require "lsp"
