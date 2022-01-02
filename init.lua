-- cecp01's nvim config
-- https://github.com/cecp01/nvim

-- Loads caches requires
pcall(require, "impatient")

-- Sources core defaults
require "core.settings"
require "core.mappings"
require "core.utils"
require "core.commands"

-- Load plugins
require "core.plugins"
pcall(require, "packer_compiled")

-- LSP
require "modules.lsp"
