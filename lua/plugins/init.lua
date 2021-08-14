--  Automatically install Packer if its missing
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system { "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path }
	execute "packadd packer.nvim"
end

return require "packer".startup(function(use)
	-- LSP
	use "neovim/nvim-lspconfig"
	use "kabouzeid/nvim-lspinstall"

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		config = function()
			require "plugins.treesitter"
		end,
		run = ":TSUpdate",
	}

	-- Nvimtree
	use {
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require "plugins.nvimtree"
		end
	}
	use {
		"windwp/nvim-ts-autotag",
		after = "nvim-treesitter",
		ft = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact"
		}
	}
	use {
		"MaxMEllon/vim-jsx-pretty",
		ft = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact"
		}
	}

	-- Autocompletion
	use {
		"hrsh7th/nvim-compe",
		event = "InsertEnter",
		config = function()
			require "plugins.compe"
		end,
		requires = {
			{
				"windwp/nvim-autopairs",
				module = {
					"nvim-autopairs",
					"nvim-autopairs.completion.compe"
				}
			}
		}
	}


	-- Telescope
	use {
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		module = {
			"telescope",
			"telescope.builtin",
			"modules.telescope"
		},
		config = function()
			require "plugins.telescope"
		end
	}

	-- Statusline
	-- use {
		-- "hoob3rt/lualine.nvim",
		-- config = function()
			-- require "plugins.lualine"
		-- end
	-- }
	
	-- Bufferline
	use "akinsho/nvim-bufferline.lua"

	-- Formatter
	use {
		"mhartington/formatter.nvim",
		cmd = "Format",
		config = function()
			require "plugins.formatter"
		end
	}

	-- Colorscheme
	use {
		"rktjmp/lush.nvim",
		cmd = {
			"Lushify",
			"LushRunTutorial"
		}
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
		keys = "<Plug>(EasyAlign)"
	}
	use {
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		config = function()
			require "colorizer".setup()
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

