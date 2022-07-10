local opt = vim.opt
local g = vim.g

opt.confirm    = true
opt.cmdheight  = 1
opt.cursorline = true
opt.scrolloff  = 5

opt.expandtab   = false
opt.shiftwidth  = 4
opt.autoindent  = true
opt.smartindent = true
opt.tabstop     = 4

opt.hlsearch   = true
opt.hidden     = true
opt.ignorecase = true
opt.smartcase  = true

opt.number         = true
opt.numberwidth    = 2
opt.relativenumber = true

opt.signcolumn    = "no"
opt.splitbelow    = true
opt.splitright    = true
opt.termguicolors = true
opt.undofile      = true
opt.swapfile      = false
opt.foldmethod    = "marker"
opt.wrap          = false

-- opt.mouse = "a"
opt.shell = "fish"
opt.list     = false
opt.listchars = {
	eol   = "﬋",
	tab   = "  ",
	trail = "."
}

-- opt.laststatus = 3
-- opt.winbar = "%=%m %t"

opt.guifont = "JetBrains Mono:h8"
g.neovide_cursor_animation_length = 0
