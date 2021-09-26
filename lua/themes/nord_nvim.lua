-- use {
-- "shaunsingh/nord.nvim",
-- config = function()
-- require "themes.nord_buddy"
-- end
-- }

vim.g.nord_borders = true
vim.cmd("colo nord")
vim.cmd[[
hi Mode guifg=#a3be8c guibg=#2e3440 gui=bold
hi TelescopeBorder guifg=#434c5e
]]
