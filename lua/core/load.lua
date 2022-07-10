require("core.options")
require("core.mappings")
require("core.autocmds")

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_repo = "https://github.com/wbthomason/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print("Installing dependencies...")
	vim.fn.system({ "git", "clone", packer_repo, install_path })
	vim.cmd("packadd packer.nvim")
	print("Dependencies installed. Restart Neovim and run ':PackerSync'.")
end

pcall(require, "impatient")
require("plugins")
require("plugins.configs.netrw")
