local o = vim.opt

o.termguicolors = true
o.splitbelow    = true
o.splitright    = true
o.swapfile      = false
o.foldmethod    = "marker"
o.cmdheight     = 2
o.laststatus    = 3

o.incsearch  = true
o.hlsearch   = true
o.ignorecase = true

o.cursorline     = true
o.number         = true
o.relativenumber = true
o.scrolloff      = 5
o.wrap           = false

o.pumheight = 10

o.autoindent  = true
o.cindent     = true
o.expandtab   = false
o.list        = false
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

vim.opt.wildignore = { "node_modules/**", ".git/**" }
