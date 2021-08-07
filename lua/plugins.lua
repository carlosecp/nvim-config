-- Automatically install Packer if its missing
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
	execute "packadd packer.nvim"
end

return require "packer".startup({function(use)
	-- LSP
	use "neovim/nvim-lspconfig"
	use {
		"kabouzeid/nvim-lspinstall",
		config = function()
			require "lsp"
		end
	}
	use {
		"glepnir/lspsaga.nvim",
		config = function()
			require "modules.lspsaga"
		end
	}

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require "modules.treesitter"
		end,
		event = "BufRead",
		run = ":TSUpdate",
	}
	use {
		"windwp/nvim-ts-autotag",
		after = "nvim-treesitter",
		ft = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact"
		}
	}
	-- Using vim-jsx-pretty to fix React indentation
	use {
		"MaxMEllon/vim-jsx-pretty",
		ft = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact"
		}
	}

	-- Autocompletion
	use {
		"hrsh7th/nvim-compe",
		config = function()
			require "modules.compe"
		end,
		event = "InsertEnter",
		requires = {
			{"windwp/nvim-autopairs", event = "InsertEnter"},
			"ray-x/lsp_signature.nvim"
		}
	}

	-- Nvimtree
	use {
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require"modules.nvimtree"
		end,
		requires = {
			"kyazdani42/nvim-web-devicons"
		}
	}

	-- Telescope
	use {
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		config = function()
			require"modules.telescope"
		end,
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons"
		}
	}

	-- Terminal
	use {
		"numtostr/FTerm.nvim",
		config = function()
			require "FTerm".setup()
		end
	}

	-- Colorscheme
	use {
		"projekt0n/github-nvim-theme",
		config = function()
			require "colors"
		end
	}

	-- Statusline
	use {
		"hoob3rt/lualine.nvim",
		config = function()
			require "modules.lualine"
		end
	}

	-- Gitsigns
	use {
		"lewis6991/gitsigns.nvim",
		config = function()
			require "gitsigns".setup {
				numhl = false
			}
		end,
		event = "BufReadPre",
		requires = {
			"nvim-lua/plenary.nvim"
		}
	}

	-- Trouble
	use {
		"folke/trouble.nvim",
		config = function()
			require "trouble".setup()
		end
	}

	-- Formatter
	use {
		"mhartington/formatter.nvim",
		cmd = "Format",
		config = function()
			require "modules.formatter"
		end
	}

	-- Utilities
	use {
		"blackCauldron7/surround.nvim",
		cmd = "s",
		config = function()
			require "surround".setup {}
		end
	}
	use {
		"junegunn/vim-easy-align",
		keys = "<Plug>(EasyAlign)"
	}
	use {
		"norcalli/nvim-colorizer.lua",
		config = function()
			require "colorizer".setup()
		end
	}
	use {
		"kristijanhusak/vim-carbon-now-sh",
		cmd = "CarbonNowSh"
	}

	-- Packer can manage itself
	use "wbthomason/packer.nvim"
end,
-- Configure Packer Install Interface
config = {
	display = {
		open_fn = function()
			return require "packer.util".float{ border = "single" }
		end
	}
}})

