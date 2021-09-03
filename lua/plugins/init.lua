--  Automatically install Packer if its missing
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system {"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path}
	execute "packadd packer.nvim"
end

return require "packer".startup(function(use)
	-- LSP
	use "neovim/nvim-lspconfig"
	use "kabouzeid/nvim-lspinstall"
	use {
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require "plugins.cmp"
		end,
		requires = {
			{ "hrsh7th/vim-vsnip",    after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer",   after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path",     after = "nvim-cmp" }
		}
	}
	use {
		"glepnir/lspsaga.nvim",
		config = function()
			require "plugins.lspsaga"
		end
	}
	use {
		"ray-x/lsp_signature.nvim",
		module = "lsp_signature"
	}

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		config = function()
			require "plugins.treesitter"
		end,
		run = ":TSUpdate"
	}
	use {
		"MaxMEllon/vim-jsx-pretty",
		ft = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact"
		}
	}
	use {
		"windwp/nvim-ts-autotag",
		ft = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact"
		}
	}

	-- Nvimtree
	use {
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require "plugins.nvimtree"
		end,
		setup = function()
			require "maps".nvimTree()
		end
	}

	-- Telescope
	use {
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		module = {
			"telescope",
			"telescope.builtin",
			"plugins.telescope"
		},
		config = function()
			require "plugins.telescope"
		end,
		setup = function()
			require "maps".telescope()
		end,
		requires = {{
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make"
		}}
	}

	-- Colorscheme
	use {
		"$HOME/themes.nvim",
		requires = "rktjmp/lush.nvim"
	}

	-- Formatter
	use {
		"mhartington/formatter.nvim",
		cmd = "Format",
		config = function()
			require "plugins.formatter"
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
		"kristijanhusak/vim-carbon-now-sh",
		cmd = "CarbonNowSh"
	}
	use {
		"junegunn/vim-easy-align",
		cmd = "EasyAlign",
		keys = "<Plug>(EasyAlign)",
		setup = function()
			require "maps".easyAlign()
		end
	}
	use {
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			require "colorizer".setup()
		end
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
			require "plugins.devicons"
		end
	}

	-- Packer can manage itself
	use "wbthomason/packer.nvim"
end)

