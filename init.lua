-- Importing Configs
require "settings"
require "plugins"

-- Sourcing VimScript
-- Mappings are just easier to set with VimL
vim.g.mapleader = " "
vim.cmd[[source $HOME/.config/nvim/viml/maps.vim]]
vim.cmd[[source $HOME/.config/nvim/viml/statusline.vim]]
