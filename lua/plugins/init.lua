-- Automatically install Packer if its missing
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
	execute "packadd packer.nvim"
end

return require "packer".startup({function(use)
	-- LSP
	use "neovim/nvim-lspconfig"
	use {
		"kabouzeid/nvim-lspinstall",
		config = function()
			require "lsp"
		end
	}
	use {
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		config = function()
			require "plugins.lspsaga"
		end
	}

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		config = function()
			require "plugins.treesitter"
		end,
		run = ":TSUpdate",
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
	-- Using vim-jsx-pretty to fix React indentation
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
			{ "windwp/nvim-autopairs", event = "InsertEnter" },
		}
	}

	-- Nvimtree
	use {
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require"plugins.nvimtree"
		end,
		require = {
			"nvim-web-devicons"
		}
	}

	-- Telescope
	use {
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		module = {
			"telescope.builtin"
		},
		config = function()
			require"plugins.telescope"
		end
	}

	-- Statusline
	use {
		"hoob3rt/lualine.nvim",
		config = function()
			require "plugins.lualine"
		end
	}


	-- Colorscheme
	use {
		"projekt0n/github-nvim-theme",
		config = function()
			require "colors"
		end
	}

	-- Formatter
	use {
		"mhartington/formatter.nvim",
		cmd = "Format",
		config = function()
			require "plugins.formatter"
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
		"junegunn/vim-easy-align",
		cmd = "EasyAlign",
		keys = "<Plug>(EasyAlign)"
	}
	use {
		"norcalli/nvim-colorizer.lua",
		event = "BufReadPre",
		-- event = "BufWinEnter",
		config = function()
			require "colorizer".setup()
		end
	}
	use {
		"kristijanhusak/vim-carbon-now-sh",
		cmd = "CarbonNowSh"
	}

	-- Trouble
	-- use {
		-- "folke/trouble.nvim",
		-- config = function()
			-- require "trouble".setup {
				-- mode = "loclist"
			-- }
		-- end
	-- }

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
		module = "nvim-web-devicons"
	}
	use {
		"ray-x/lsp_signature.nvim",
		module = "lsp_signature"
	}

	-- Packer can manage itself
	use "wbthomason/packer.nvim"
end,
-- Configure Packer Install Interface
config = {
	display = {
		open_fn = function()
			return require "packer.util".float{ border = "single" }
		end
	}
}})

