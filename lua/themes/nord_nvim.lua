-- use {
-- "shaunsingh/nord.nvim",
-- config = function()
-- require "themes.nord_nvim"
-- end
-- }

vim.g.nord_borders = true
-- vim.g.nord_disable_background = true
vim.cmd("colo nord")
vim.cmd[[
hi EndOfBuffer guifg=#2e3440
]]
