-- Source Defaults
require "settings"
require "mappings"

-- Plugins
-- Optional Plugins
_G.plugins = { autopairs = false }
require "plugins"

-- Core Modules
-- To install new language servers:
-- :LspInstall <lang_name>
require "modules.lsp"
require "modules.terminal"

-- Extra Settings
vim.cmd[[colorscheme github]]

