-- Bootstrap
-- Install packer.nvim plugin manager automatically if not installed already.
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_repo = "https://github.com/wbthomason/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print("Installing dependencies...")
	vim.fn.system({ "git", "clone", packer_repo, install_path })
	vim.cmd("packadd packer.nvim")
	print("Dependencies installed. Restart Neovim and run ':PackerSync'.")
end

return require("packer").startup(function(use)
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
			require("configs.cmp")
		end,
		requires = {
			{
				"L3MON4D3/LuaSnip",
				module = "luasnip",
				config = function()
					require("configs.luasnip")
				end
			},
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer",       after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lua",     after = "nvim-cmp" },
			{ "hrsh7th/cmp-path",         after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp",     module = "cmp_nvim_lsp" },
			{ "windwp/nvim-autopairs",    module = "nvim-autopairs" }
		}
	}

	use {
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		module = "nvim-treesitter.ts_utils",
		config = function()
			require("configs.treesitter")
		end,
		run = ":TSUpdate",
		requires = {{
			"nvim-treesitter/nvim-treesitter-refactor",
			after = "nvim-treesitter"
		}}
	}

	use {
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		config = function()
			require("configs.telescope")
		end,
		module = {
			"telescope",
			"telescope.builtin",
			"configs.telescope"
		},
		requires = {{
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make"
		}},
		setup = function()
			require("mappings").telescope()
		end
	}

	use {
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require("configs.nvimtree")
		end,
		setup = function()
			require("mappings").nvimtree()
		end
	}

	use {
		"projekt0n/github-nvim-theme",
		config = function()
			require("colorschemes.github")
		end
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
			require("mappings").easy_align()
		end
	}

	use {
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("configs.colorizer")
		end
	}

	use {
		"nathom/filetype.nvim",
		config = function()
			require("configs.filetype")
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
			require("configs.devicons")
		end
	}

	use {
		"jbyuki/venn.nvim",
		cmd = "VBox"
	}

	use "lewis6991/impatient.nvim"
	use "wbthomason/packer.nvim"
	use "milisims/nvim-luaref"
end)
