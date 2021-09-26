-- use {
-- "arcticicestudio/nord-vim",
-- config = function()
-- require "themes.nord"
-- end
-- }

vim.cmd("colo nord")
vim.cmd[[
hi Mode guifg=#8fbcbb guibg=#2e3440 gui=bold
hi TelescopeBorder guifg=#434c5e

hi TSTypeBuiltin guifg=#81a1c1
hi TSConstBuiltin guifg=	#88c0d0

hi Boolean guifg=	#88c0d0
hi Type guifg=#8fbcbb
hi Structure guifg=#8fbcbb
]]
