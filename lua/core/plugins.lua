--  Automatically install Packer if its missing
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system {
		"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path }
	execute "packadd packer.nvim"
end

local frontend_ft = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact"
}

return require "packer".startup(function(use)
	-- LSP
	use "neovim/nvim-lspconfig"

	-- Autocompletion
	use {
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require "configs.cmp"
		end,
		requires = {
			{
				"hrsh7th/vim-vsnip",
				after = "nvim-cmp",
				config = function()
					require "configs.vsnip"
				end
			},
			{ "hrsh7th/cmp-vsnip",    after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer",   after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path",     after = "nvim-cmp" }
		}
	}

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		config = function()
			require "configs.treesitter"
		end,
		run = ":TSUpdate",
		requires = {
			{ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
		}
	}
	use {
		"MaxMEllon/vim-jsx-pretty",
		ft = frontend_ft
	}

	-- Fuzzy Finder
	use {
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		module = {
			"telescope",
			"telescope.builtin",
			"configs.telescope"
		},
		config = function()
			require "configs.telescope"
		end,
		setup = function()
			require "core.mappings".telescope()
		end,
		requires = {{
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make"
		}}
	}

	-- Explorer
	use {
		"kyazdani42/nvim-tree.lua",
		commit = "da26dfa",
		cmd = "NvimTreeToggle",
		config = function()
			require "configs.nvimtree"
		end,
		setup = function()
			require "core.mappings".nvimtree()
		end
	}

	-- Colorscheme
	use {
		"shaunsingh/nord.nvim",
		config = function()
			require "themes.nord_nvim"
		end
	}

	-- Colaborative Sessions
-- 	use {
-- 		"jbyuki/instant.nvim",
-- 		config = function()
-- 			require "configs.instant"
-- 		end
-- 	}

	-- Utilities
	use {
		"ThePrimeagen/harpoon",
		module = {
			"harpoon.mark",
			"harpoon.ui"
		},
		config = function()
			require "configs.harpoon"
		end
	}
	use {
		"tpope/vim-surround",
		keys = {
			{"v", "S"}
		}
	}
	use {
		"junegunn/vim-easy-align",
		cmd = "EasyAlign",
		keys = "<Plug>(EasyAlign)",
		setup = function()
			vim.g.easy_align_ignore_groups = {}
			require "core.mappings".easyAlign()
		end
	}
	use {
		"norcalli/nvim-colorizer.lua",
		cmd = "ColorizerToggle",
		config = function()
			require "configs.colorizer"
		end,
	}

	-- Modules
	use {
		"nvim-lua/popup.nvim",
		module = "popup"
	}
	use {
		"nvim-lua/plenary.nvim",
		module = "plenary"
	}
	use {
		"kyazdani42/nvim-web-devicons",
		module = "nvim-web-devicons",
		config = function()
			require "configs.devicons"
		end
	}

	-- Packer can manage itself
	use "wbthomason/packer.nvim"
end)

