-- use {
-- "arcticicestudio/nord-vim",
-- config = function()
-- require "themes.nord"
-- end
-- }

vim.cmd("colo nord")
-- Interface
vim.cmd[[
hi Mode guifg=#a3be8c guibg=NONE gui=bold
hi NvimTreeEndOfBuffer guifg=#2e3440
hi NvimTreeEndOfBuffer guifg=#2e3440
]]

-- Syntax
vim.cmd[[
hi Boolean guifg=	#88c0d0
hi Type guifg=#8fbcbb
hi Structure guifg=#8fbcbb
hi TSTypeBuiltin guifg=#81a1c1
hi TSConstBuiltin guifg=	#88c0d0
hi rainbowcol1 guifg=#b48ead
hi rainbowcol2 guifg=#ebcb8b
hi rainbowcol3 guifg=#bf616a
hi rainbowcol4 guifg=#8fbcbb
hi rainbowcol5 guifg=#88c0d0
hi rainbowcol6 guifg=#b48ead
hi rainbowcol7 guifg=#ebcb8b
]]

