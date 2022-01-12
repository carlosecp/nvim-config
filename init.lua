-- cecp01's nvim config
-- https://github.com/cecp01/nvim

-- Loads caches requires
-- pcall(require, "impatient")

-- Sources core defaults
require "core.options"
require "core.mappings"
require "core.autocommands"

-- Load plugins
require "core.plugins"
pcall(require, "packer_compiled")

require "core.lsp"
require "core.terminal"
