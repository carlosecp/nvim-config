local o = vim.opt

-- Defaults
o.hidden         = true
o.cursorline     = true
o.termguicolors  = true
o.splitbelow     = true
o.splitright     = true

-- Search
o.incsearch      = true
o.hlsearch       = true
o.ignorecase     = true

-- Scrolling
o.number         = true
o.relativenumber = true
o.wrap           = false
o.scrolloff      = 5

-- Autocompletion
o.completeopt    = {
  "menu",
  "menuone",
  "noselect",
	"noinsert"
}
o.pumheight      = 10
o.cmdheight      = 2

-- Indentation
o.expandtab      = false
o.tabstop        = 2
o.shiftwidth     = 2
o.autoindent     = true
o.smartindent    = true
o.smarttab       = true

-- Shell
o.shell = "fish"

-- Format Options
-- Stop adding comments on newline
vim.cmd[[au BufEnter * set fo-=c fo-=r fo-=o]]
