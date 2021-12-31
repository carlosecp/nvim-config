-- cecp01's nvim config
-- https://github.com/cecp01/nvim

-- Sources core defaults
require "core.settings"
require "core.mappings"
require "core.utils"
require "core.commands"

-- Load plugins and cached plugins
require "impatient"
require "core.plugins"
require "packer_compiled"

-- Custom features and lsp
require "modules.statusline"
require "modules.lsp"
require "modules.terminal"
require "modules.netrw"
