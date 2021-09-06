--  Automatically install Packer if its missing
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system {"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path}
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

local ts_playground_cmds = {"TSPlaygroundToggle", "TSHighlightCapturesUnderCursor"}

return require "packer".startup(function(use)
	-- Language Server Protocol
	-- Autcompletion
	use "neovim/nvim-lspconfig"
	use "kabouzeid/nvim-lspinstall"
	use {
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require "configs.cmp"
		end,
		requires = {
			-- nvim-cmp modules to provide completion sources
			{ "hrsh7th/vim-vsnip",    after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer",   after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path",     after = "nvim-cmp" }
		}
	}
	use {
		"glepnir/lspsaga.nvim",
		config = function()
			require "configs.lspsaga"
		end
	}
	use {
		"ray-x/lsp_signature.nvim",
		module = "lsp_signature"
	}
	use {
		"windwp/nvim-autopairs",
		opt = _G.plugins.autopairs,
		module = { "nvim-autopairs", "nvim-autopairs.completion.cmp" }
	}

	-- Treesitter
	-- Syntax and indentation
	use {
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		config = function()
			require "configs.treesitter"
		end,
		run = ":TSUpdate",
		requires = {
			-- Treesitter modules
			-- https://github.com/nvim-treesitter/nvim-treesitter#available-modules
			{ "nvim-treesitter/playground", after = "nvim-treesitter", cmd = ts_playground_cmds },
			{ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
			{ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
			{ "windwp/nvim-ts-autotag", after = "nvim-treesitter", ft = frontend_ft },
			{ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" }
		}
	}
	-- Using this to help Neovim with indentation in JSX
	use {
		"MaxMEllon/vim-jsx-pretty",
		ft = frontend_ft
	}

	-- NvimTree
	-- File explorer
	use {
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require "configs.nvimtree"
		end,
		setup = function()
			require "core.mappings".nvimTree()
		end
	}

	-- Telescope
	-- Fuzzy finder
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
	-- My custom colorschemes
	use {
		"$HOME/themes.nvim", -- I have this repo locally to test my changes
		-- "itscarlosecp/theme.nvim", if you don't have this repo locally
		requires = "rktjmp/lush.nvim"
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
			require "core.mappings".easyAlign()
		end
	}
	use {
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			require "colorizer".setup()
		end
	}

	-- Modules required for multiple plugins
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
