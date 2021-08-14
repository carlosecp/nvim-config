-- Importing Configs
require "settings"
require "modules"

-- Sourcing VimScript
-- Mappings are just easier to set with VimL
vim.g.mapleader = " "
vim.cmd[[source $HOME/.config/nvim/viml/maps.vim]]

-- Colorscheme
require "colors"

