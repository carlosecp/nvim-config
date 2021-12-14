-- Automatically install Packer if its missing
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

local ts_playground_cmds = {
	"TSPlaygroundToggle",
	"TSHighlightCapturesUnderCursor"
}

return require "packer".startup(function(use)
	-- LSP
	use "neovim/nvim-lspconfig"
	use {
		"williamboman/nvim-lsp-installer",
		"jose-elias-alvarez/null-ls.nvim"
	}

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
			{ "hrsh7th/cmp-nvim-lsp", module = "cmp_nvim_lsp" },
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
			{ "windwp/nvim-ts-autotag", after = "nvim-treesitter", ft = frontend_ft },
			{
				"nvim-treesitter/playground" ,
				after = "nvim-treesitter",
				cmd = ts_playground_cmds
			}
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

	-- Statusline
	use {
		"tjdevries/express_line.nvim",
		config = function()
			require "configs.express_line"
		end
	}

	-- File Explorer
	use {
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require "configs.nvimtree"
		end
	}

	-- Colorscheme
	use {
		"ishan9299/nvim-solarized-lua",
		config = function()
			require "themes.nvim_solarized_lua"
		end
	}

	-- Utilities
	use {
		"numToStr/Comment.nvim",
		config = function()
			require "configs.comment"
		end
	}
	use {
		"tpope/vim-surround",
		keys = {
			{ "v", "S" }
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

