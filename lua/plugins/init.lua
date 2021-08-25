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
		config = function()
			require "plugins.cmp"
		end,
		requires = {
			-- Extensions
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			{ "hrsh7th/cmp-nvim-lua", ft = "lua" },

			-- Other
			"windwp/nvim-autopairs",
			{ "ray-x/lsp_signature.nvim", module = "lsp_signature" },
		}
	}
	use {
		"glepnir/lspsaga.nvim",
		config = function()
			require "plugins.lspsaga"
		end
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

	-- Nvimtree
	use {
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require "plugins.nvimtree"
		end,
		setup = function()
			require "mappings".nvimTree()
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
			require "mappings".telescope()
		end,
		requires = {{
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make"
		}}
	}

	-- Lualine
	use {
		"hoob3rt/lualine.nvim",
		config = function()
			require "plugins.lualine"
		end
	}

	-- Colorscheme
	use {
		"shaunsingh/nord.nvim",
		config = function()
			require "colors"
		end
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
		"junegunn/vim-easy-align",
		cmd = "EasyAlign",
		keys = "<Plug>(EasyAlign)",
		setup = function()
			require "mappings".easyAlign()
		end
	}
	use {
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			require "colorizer".setup()
		end
	}
	use {
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		config = function()
			require "gitsigns".setup()
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

