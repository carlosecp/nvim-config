local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.did_lload_filetypes = 0
g.do_filetype_lua = 1
g.clipboard = {
    name = "kitty",
    copy = {
	["+"] = {"kitty", "+kitten", "clipboard"},
	["*"] = {"kitty", "+kitten", "clipboard"}
    },
    paste = {
	["+"] = {"kitty", "+kitten", "clipboard", "--get-clipboard"},
	["*"] = {"kitty", "+kitten", "clipboard", "--get-clipboard"}
    }
}

opt.confirm = true
opt.laststatus = 2
opt.cmdheight = 1
opt.cursorline = true
opt.scrolloff = 5

opt.expandtab = false
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2

opt.hlsearch = true
opt.hidden = true
opt.ignorecase = true
opt.smartcase = true

opt.number = true
opt.numberwidth = 2
opt.relativenumber = true

opt.signcolumn = "no"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.undofile = true
opt.swapfile = false
opt.foldmethod = "marker"
opt.wrap = false
