-- use {
-- "shaunsingh/nord.nvim",
-- config = function()
-- require "themes.nord_nvim"
-- end
-- }

vim.g.nord_borders = true
vim.cmd("colo nord")
vim.cmd[[
hi Comment gui=italic
hi VertSplit guibg=#3b4252
hi NvimTreeGitIgnored gui=NONE

hi Normal guibg=NONE
]]
