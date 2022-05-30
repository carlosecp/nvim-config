-- Bootstrap plugin manager.
-- Install packer.nvim automatically if not installed already.

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_repo = "https://github.com/wbthomason/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print "Installing dependencies..."
	vim.fn.system({ "git", "clone", packer_repo, install_path })
	vim.cmd "packadd packer.nvim"
	print "Dependencies installed. Restart Neovim and run ':PackerSync'."
end

return require("packer").startup(function(use)
	use {
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/nvim-lsp-installer",
			"jose-elias-alvarez/null-ls.nvim",
			"j-hui/fidget.nvim",
			"stevearc/aerial.nvim"
		}
	}

	use {
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("plugins.configs.cmp")
		end,
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			{ "hrsh7th/cmp-nvim-lua",  after = "nvim-cmp" },
			{ "hrsh7th/cmp-path",      after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer",    after = "nvim-cmp" },
			-- { "windwp/nvim-autopairs", module = "nvim-autopairs" }
		}
	}

	use {
		"L3MON4D3/LuaSnip",
		module = "luasnip",
		config = function()
			require("plugins.configs.luasnip")
		end
	}

	use {
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.configs.treesitter")
		end,
		run = ":TSUpdate",
		requires = {{
			"nvim-treesitter/nvim-treesitter-refactor",
			after = "nvim-treesitter"
		}}
	}

	use {
		"bakpakin/fennel.vim",
		ft = "fennel"
	}

	use {
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		config = function()
			require("plugins.configs.telescope")
		end,
		module = {
			"telescope",
			"telescope.builtin",
			"plugins.configs.telescope"
		},
		requires = {{
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make"
		}},
		setup = function()
			require("core.mappings").telescope()
		end
	}

	use {
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require("plugins.configs.nvimtree")
		end,
		setup = function()
			require("core.mappings").nvimtree()
		end
	}
	
	use {
		"sainnhe/gruvbox-material",
		config = function()
			require("plugins.themes.gruvbox_material")
		end
	}

	use {
		"junegunn/vim-easy-align",
		cmd = "EasyAlign",
		keys = "<Plug>(EasyAlign)",
		setup = function()
			vim.g.easy_align_ignore_groups = {}
			require("core.mappings").easy_align()
		end
	}

	use {
		"norcalli/nvim-colorizer.lua",
		event = "BufEnter",
		config = function()
			require("plugins.configs.colorizer")
		end
	}

-- 	use {
-- 		"numToStr/Navigator.nvim",
-- 		config = function()
-- 			require("plugins.configs.navigator")
-- 		end,
-- 		setup = function()
-- 			require("core.mappings").navigator()
-- 		end
-- 	}

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
			require("plugins.configs.devicons")
		end
	}

	use "lewis6991/impatient.nvim"
	use "wbthomason/packer.nvim"
	use "milisims/nvim-luaref"
end)
