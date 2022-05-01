local o = vim.opt

vim.g.filetype_lua = 1
o.autoindent = true
o.cindent = true
o.cmdheight = 2
o.completeopt = "menu,menuone,noinsert,noselect"
o.cursorline = true
o.expandtab = false
o.foldmethod = "marker"
o.hlsearch = true
o.ignorecase = true
o.incsearch = true
o.laststatus = 2
o.list = false
o.listchars = {
	eol = "﬋",
	tab = "  "
}
o.number = true
o.pumheight = 10
o.relativenumber = true
o.scrolloff = 5
o.shell = "sh"
o.shiftwidth = 2
o.smartindent = true
o.smarttab = true
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.tabstop = 2
o.termguicolors = true
o.wildignore = {
	"node_modules/**",
	".git/**"
}
o.wrap = false
