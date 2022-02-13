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
if not status_ok then return end

return packer.startup {
	function(use)
		-- LSP
		use {
			"neovim/nvim-lspconfig",
			requires = {
				"williamboman/nvim-lsp-installer",
				"jose-elias-alvarez/null-ls.nvim"
			}
		}
		--		TODO: Figure out why this is not working in neovim 0.6
		--		Probably I should just fork this plugin and build my own inlay hints plugin.
		--		https://github.com/simrat39/rust-tools.nvim/tree/master/lua/rust-tools
		--		use {
		--			"nvim-lua/lsp_extensions.nvim",
		--			module = "lsp_extensions"
		--		}
		use {
			"carlosecp/diaglist.nvim",
			after = "nvim-lspconfig",
			config = function()
				require("carlosecp.diaglist")
			end
		}

		-- Autocompletion
		use {
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
			config = function()
				require("carlosecp.cmp")
			end,
			requires = {
				{
					"L3MON4D3/LuaSnip",
					after = "nvim-cmp",
					config = function()
						require("carlosecp.luasnip")
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
				require("carlosecp.treesitter")
			end,
			run = ":TSUpdate",
			requires = {
				{ "nvim-treesitter/playground",
					cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" }},
				{ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" }
			}
		}

		-- Fuzzy finder
		use {
			"nvim-telescope/telescope.nvim",
			cmd = "Telescope",
			config = function()
				require("carlosecp.telescope")
			end,
			module = { "telescope", "telescope.builtin" },
			requires = {{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "make"
			}},
			setup = function()
				require("carlosecp.keymappings").telescope()
			end
		}

		-- File explorer
		use {
			"kyazdani42/nvim-tree.lua",
			cmd = "NvimTreeToggle",
			commit = "d8bf1ad",
			config = function()
				require("carlosecp.nvimtree")
			end,
			setup = function()
				require("carlosecp.keymappings").nvimtree()
			end
		}

		-- Colorscheme
use {
	"tjdevries/gruvbuddy.nvim",
	config = function()
		require("carlosecp.colorschemes.gruvbuddy")
	end,
	requires = "tjdevries/colorbuddy.vim"
}

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
				require("carlosecp.keymappings").easy_align()
			end
		}
		use {
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("carlosecp.colorizer")
			end
		}

		-- Neovim overall performance
		use {
			"nathom/filetype.nvim",
			config = function()
				require("carlosecp.filetype")
			end
		}
		use "lewis6991/impatient.nvim"
		use {
			"dstein64/vim-startuptime",
			cmd = "StartupTime"
		}

		-- Modules
		use {
			"nvim-lua/plenary.nvim",
			module = "plenary"
		}
		use {
			"kyazdani42/nvim-web-devicons",
			module = "nvim-web-devicons",
			config = function()
				require("carlosecp.devicons")
			end
		}

		-- Packer can manage itself
		use "wbthomason/packer.nvim"
	end,
	config = {
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua"
	}
}
