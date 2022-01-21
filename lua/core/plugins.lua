local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system {
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		install_path
	}
	print("Installing packer close and reopen Neovim...")
	vim.cmd("packadd packer.nvim")
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return packer.startup {
	function(use)
		-- LSP
		use {
			"neovim/nvim-lspconfig",
			config = function()
				require "lsp"
			end,
			requires = {
				"williamboman/nvim-lsp-installer",
				"jose-elias-alvarez/null-ls.nvim"
			}
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
					"L3MON4D3/LuaSnip",
					after = "nvim-cmp",
					config = function()
						require "configs.luasnip"
					end
				},
				{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
				{ "hrsh7th/cmp-buffer",       after = "nvim-cmp" },
				{ "hrsh7th/cmp-nvim-lsp",     module = "cmp_nvim_lsp" },
				{ "hrsh7th/cmp-nvim-lua",     after = "nvim-cmp" },
				{ "hrsh7th/cmp-path",         after = "nvim-cmp" },
				{ "f3fora/cmp-spell",         after = "nvim-cmp" }
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
				{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
				{ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" }
			}
		}

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

		-- File explorer
		use {
			"kyazdani42/nvim-tree.lua",
			cmd = "NvimTreeToggle",
			config = function()
				require "configs.nvimtree"
			end,
			setup = function()
				require "core.mappings".nvim_tree()
			end
		}

		-- Colorscheme
		use "rktjmp/lush.nvim"

		-- Utilities
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

		-- Neovim overall performance
		use {
			"nathom/filetype.nvim",
			config = function()
				require "configs.filetype"
			end
		}
		use "lewis6991/impatient.nvim"
		use {
			"dstein64/vim-startuptime",
			cmd = "StartupTime"
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
	end,
	config = {
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua"
	}
}
