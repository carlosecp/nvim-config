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
		}
	}

	use {
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("plugins.cmp")
		end,
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path",     after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer",   after = "nvim-cmp" },
			-- { "windwp/nvim-autopairs", module = "nvim-autopairs" }
			{ "onsails/lspkind.nvim", module = "lspkind" }
		}
	}

	use {
		"L3MON4D3/LuaSnip",
		module = "luasnip",
		config = function()
			require("plugins.luasnip")
		end
	}

	use {
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.treesitter")
		end,
		run = ":TSUpdate",
		requires = {{
			"nvim-treesitter/nvim-treesitter-refactor",
			after = "nvim-treesitter"
		}}
	}

	use {
		"ibhagwan/fzf-lua",
		setup = function()
			require("mappings").fzf()
		end,
		config = function()
			require("plugins.fzflua")
		end
	}

	use {
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require("plugins.nvimtree")
		end,
		setup = function()
			require("mappings").nvimtree()
		end
	}
	
	use "rktjmp/lush.nvim"

	use {
		"tpope/vim-surround",
		keys = { "v", "S" }
	}

	use {
		"junegunn/vim-easy-align",
		cmd = "EasyAlign",
		keys = "<Plug>(EasyAlign)",
		setup = function()
			-- vim.g.easy_align_ignore_groups = {}
			require("mappings").easy_align()
		end
	}

	use {
		"norcalli/nvim-colorizer.lua",
		event = "BufEnter",
		config = function()
			require("plugins.colorizer")
		end
	}

	use {
		"onsails/diaglist.nvim",
		config = function()
			require("plugins.diaglist")
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
			require("plugins.devicons")
		end
	}

	use "lewis6991/impatient.nvim"
	use "wbthomason/packer.nvim"
	use "milisims/nvim-luaref"
end)
