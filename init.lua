-- cecp01's nvim config
-- https://github.com/cecp01/nvim

-- Loads caches requires
pcall(require, "impatient")

-- Sources core defaults
require "cecp01.core.options"
require "cecp01.core.mappings"
require "cecp01.core.autocommands"

-- Load plugins
require "cecp01.core.plugins"
pcall(require, "packer_compiled")

require "cecp01.lsp"
require "cecp01.core.terminal"
