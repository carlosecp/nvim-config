return require("packer").startup(function(use)
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
		end,
		requires = {
			"j-hui/fidget.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"ray-x/lsp_signature.nvim"
		}
	})

	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("plugins.configs.cmp")
		end,
		requires = {
			{ "hrsh7th/cmp-buffer",       after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp",     after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lua",     after = "nvim-cmp" },
			{ "hrsh7th/cmp-path",         after = "nvim-cmp" },
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			{ "onsails/lspkind.nvim",     module = "lspkind" },
			{ "windwp/nvim-autopairs",    module = "nvim-autopairs" },
			-- { "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" }
		}
	})

	use({
		"L3MON4D3/LuaSnip",
		module = "luasnip",
		config = function()
			require("plugins.configs.luasnip")
		end
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.configs.treesitter")
		end,
		run = ":TSUpdate",
		requires = {
			{
				"nvim-treesitter/nvim-treesitter-refactor",
				after = "nvim-treesitter"
			},
			{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }
		}
	})


	use({
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.configs.comment")
		end
	})

	use({
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require("plugins.configs.nvimtree")
		end,
		setup = function()
			require("core.mappings").nvimtree()
		end
	})

	use({
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
	})

	use({
		"shaunsingh/nord.nvim",
		config = function()
			require("plugins.colorschemes.nord_nvim")
		end
	})


	use({
		"junegunn/vim-easy-align",
		keys = "<Plug>(EasyAlign)",
		setup = function()
			require("core.mappings").easy_align()
		end
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("plugins.configs.colorizer")
		end
	})

	use({
		"aklt/plantuml-syntax",
		ft = "plantuml"
	})

	use({
		"onsails/diaglist.nvim",
		config = function()
			require("plugins.configs.diaglist")
		end
	})

	use({
		"kyazdani42/nvim-web-devicons",
		module = "nvim-web-devicons",
		config = function()
			require("plugins.configs.devicons")
		end
	})

	use({ "dstein64/vim-startuptime", cmd = "StartupTime" })
	use({ "nvim-lua/plenary.nvim", module = "plenary" })

	use("tpope/vim-surround")
	use("lewis6991/impatient.nvim")
	use("wbthomason/packer.nvim")
	use("milisims/nvim-luaref")
end)
