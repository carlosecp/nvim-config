local o = vim.opt
o.termguicolors = true
o.splitbelow    = true
o.splitright    = true
o.swapfile      = false
o.foldmethod    = "marker"

-- Search
o.incsearch  = true
o.hlsearch   = true
o.ignorecase = true

-- Lines / scrolling
o.cursorline     = true
o.number         = true
o.relativenumber = true
o.scrolloff      = 5
o.wrap           = false

-- Autocompletion
o.pumheight = 10
o.cmdheight = 2

-- Indentation
o.autoindent  = true
o.cindent     = true
o.expandtab   = false
o.list        = true
o.listchars   = {
	eol = "﬋",
	tab = "  "
}
o.shiftwidth  = 2
o.smartindent = true
o.smarttab    = true
o.tabstop     = 2

o.shell = "sh"
vim.g.do_filetype_lua = 1
