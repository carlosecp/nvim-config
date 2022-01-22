-- carlosecp's nvim config
-- https://github.com/carlosecp/nvim

-- Loads caches requires
pcall(require, "impatient")

-- Sources core defaults
require "core.options"
require "core.mappings"
require "core.autocommands"

-- Load plugins
require "core.plugins"
pcall(require, "packer_compiled")

vim.cmd("colo lush_default")
require "core.terminal"
