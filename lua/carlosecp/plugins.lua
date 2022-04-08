local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_repo = "https://github.com/wbthomason/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({ "git", "clone", packer_repo, install_path })
	print("Installing packer close and reopen Neovim...")
	vim.cmd("packadd packer.nvim")
end

local packer = require("packer")
return packer.startup({
	function(use)
		use {
			"neovim/nvim-lspconfig",
			requires = {
				"williamboman/nvim-lsp-installer",
				"jose-elias-alvarez/null-ls.nvim",
				"j-hui/fidget.nvim"
			}
		}

		use {
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
			config = function()
				require("carlosecp.cmp")
			end,
			requires = {
				{
					"L3MON4D3/LuaSnip",
					module = "luasnip",
					config = function()
						require("carlosecp.luasnip")
					end
				},
				{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
				{ "hrsh7th/cmp-buffer",       after = "nvim-cmp" },
				{ "hrsh7th/cmp-nvim-lsp",     module = "cmp_nvim_lsp" },
				{ "hrsh7th/cmp-nvim-lua",     after = "nvim-cmp" },
				{ "hrsh7th/cmp-path",         after = "nvim-cmp" },
				{ "windwp/nvim-autopairs",    module = "nvim-autopairs" }
			}
		}

		use {
			"nvim-treesitter/nvim-treesitter",
			event = "BufRead",
			module = "nvim-treesitter.ts_utils",
			config = function()
				require("carlosecp.treesitter")
			end,
			run = ":TSUpdate",
			requires = {
				{
					"nvim-treesitter/playground",
					cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" }
				},
				{ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" }
			}
		}

		use {
			"nvim-telescope/telescope.nvim",
			cmd = "Telescope",
			config = function()
				require("carlosecp.telescope")
			end,
			module = {
				"telescope",
				"telescope.builtin",
				"carlosecp.telescope"
			},
			requires = {{
				"nvim-telescope/telescope-fzf-native.nvim",
				run = "make"
			}},
			setup = function()
				require("carlosecp.mappings").telescope()
			end
		}

		use {
			"kyazdani42/nvim-tree.lua",
			cmd = "NvimTreeToggle",
			commit = "d8bf1ad",
			config = function()
				require("carlosecp.nvimtree")
			end,
			setup = function()
				require("carlosecp.mappings").nvimtree()
			end
		}

		use {
			"tjdevries/gruvbuddy.nvim",
			config = function()
				require("carlosecp.colorschemes.gruvbuddy")
			end,
			requires = "tjdevries/colorbuddy.vim"
		}

		use {
			"tpope/vim-surround",
			keys = {{ "v", "S" }}
		}

		use {
			"junegunn/vim-easy-align",
			cmd = "EasyAlign",
			keys = "<Plug>(EasyAlign)",
			setup = function()
				vim.g.easy_align_ignore_groups = {}
				require("carlosecp.mappings").easy_align()
			end
		}

		use {
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("carlosecp.colorizer")
			end
		}

		use {
			"nathom/filetype.nvim",
			config = function()
				require("carlosecp.filetype")
			end
		}

		use {
			"dstein64/vim-startuptime",
			cmd = "StartupTime"
		}

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

		use "lewis6991/impatient.nvim"
		use "wbthomason/packer.nvim"
		use "milisims/nvim-luaref"
	end,
	config = {
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua"
	}
})
