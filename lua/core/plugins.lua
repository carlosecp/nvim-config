--  Automatically install Packer if its missing
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system {
		"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path }
	execute "packadd packer.nvim"
end

-- Defining filtypes for frontend development
-- related plugins to lazy-load them
local frontend_ft = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact"
}

return require "packer".startup(function(use)
	-- LSP
	use "neovim/nvim-lspconfig"
	use {
		"kabouzeid/nvim-lspinstall",
		"jose-elias-alvarez/null-ls.nvim"
	}
	use {
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require "configs.cmp"
		end,
		requires = {
			{ "hrsh7th/cmp-buffer",   after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path",     after = "nvim-cmp" },
			{ "hrsh7th/vim-vsnip",    after = "nvim-cmp" }
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

	-- NvimTree
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

	-- Colorscheme
	use {
		"shaunsingh/nord.nvim",
		config = function()
			require "themes.nord_nvim"
		end
	}

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
		"kristijanhusak/vim-carbon-now-sh",
		cmd = "CarbonNowSh",
		config = function()
			require "configs.carbon_now_sh"
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
