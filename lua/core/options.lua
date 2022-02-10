vim.opt.termguicolors = true
vim.opt.splitbelow    = true
vim.opt.splitright    = true
vim.opt.swapfile      = false
vim.opt.foldmethod    = "marker"

-- Search
vim.opt.incsearch  = true
vim.opt.hlsearch   = true
vim.opt.ignorecase = true

-- Lines / scrolling
vim.opt.cursorline     = true
vim.opt.number         = true
vim.opt.relativenumber = true
vim.opt.scrolloff      = 5
vim.opt.wrap           = false

-- Autocompletion
vim.opt.pumheight = 10
vim.opt.cmdheight = 2

-- Indentation
vim.opt.autoindent  = true
vim.opt.cindent     = true
vim.opt.expandtab   = false
vim.opt.list        = true
vim.opt.listchars   = {
	eol = "﬋",
	lead = ".",
	tab = "  "
}
vim.opt.shiftwidth  = 2
vim.opt.smartindent = true
vim.opt.smarttab    = true
vim.opt.tabstop     = 2

vim.opt.shell = "sh"

-- Format Options
-- Stop adding comments on newline
-- vim.cmd[[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Use faster filetype detection
vim.g.do_filetype_lua = 1
