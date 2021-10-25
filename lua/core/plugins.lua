--  Automatically install Packer if its missing
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system {
		"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path }
	execute "packadd packer.nvim"
end

local lsps = {"lua", "c", "cpp"}

return require "packer".startup(function(use)
	-- LSP
	use {
		"williamboman/nvim-lsp-installer",
		ft = lsps,
		config = function()
			require "modules.lsp"
		end,
		requires = { "neovim/nvim-lspconfig" }
	}

	-- Autcompletion
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
			-- { "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
		}
	}

	-- Fuzzy Finder
	use {
		"ibhagwan/fzf-lua",
		cmd = "FzfLua",
		module = {
			"fzf-lua",
			"configs.fzf"
		},
		config = function()
			require "configs.fzf"
		end,
		setup = function()
			require "core.mappings".fzf()
		end,
		requires = {
			"vijaymarupudi/nvim-fzf"
		}
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

	-- Formatter
	-- Formatters must be installed separately
	use {
		"mhartington/formatter.nvim",
		cmd = "Format",
		config = function()
			require "configs.formatter"
		end
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
		cmd = "BufReadPre",
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

