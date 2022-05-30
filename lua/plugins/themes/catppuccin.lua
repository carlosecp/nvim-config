-- use {
-- 	"catppuccin/nvim",
-- 	as = "catppuccin",
-- 	config = function()
-- 		require("plugins.themes.catppuccin")
-- 	end
-- }

local catppuccin = require("catppuccin")

catppuccin.setup({
	transparent_background = true
})

vim.cmd("colo catppuccin")
