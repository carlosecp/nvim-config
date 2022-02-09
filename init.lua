-- carlosecp's nvim config
-- https://github.com/carlosecp/dotfiles-nvim

-- Global config values
require("core.globals")

-- Loads cached plugins
pcall(require, "impatient")

-- Sources core defaults
require("core.options")
require("core.bindings")
require("core.autocommands")

-- Load plugins
require("core.plugins")
pcall(require, "packer_compiled")
