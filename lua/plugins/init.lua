--  Automatically install Packer if its missing
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system { "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path }
	execute "packadd packer.nvim"
end

local special_ft = {
	web_dev = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact"
	}
}

return require "packer".startup {function(use)
	-- Conquer of Completion
	use {
		"neoclide/coc.nvim",
		branch = "release",
		config = function()
			vim.cmd[[ source $HOME/.config/nvim/viml/coc.vim ]]
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
		ft = special_ft.web_dev
	}
	use {
		"MaxMEllon/vim-jsx-pretty",
		ft = special_ft.web_dev
	}
	use {
		"nvim-treesitter/playground",
		cmd = {
			"TSPlaygroundToggle",
			"TSHighlightCapturesUnderCursor"
		}
	}

	-- Nvimtree
	use {
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require "plugins.nvimtree"
		end
	}

	-- Telescope
	use {
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		module = {
			"telescope",
			"telescope.builtin",
			"plugins.telescope"
		},
		config = function()
			require "plugins.telescope"
		end
	}

	-- Colorscheme
	use {
		"$HOME/themes.nvim",
		requires = "rktjmp/lush.nvim"
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
		"kristijanhusak/vim-carbon-now-sh",
		cmd = "CarbonNowSh"
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
	use {
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		config = function()
			require "gitsigns".setup()
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
end,
config = {
	display = {
		open_fn = function()
			return require "packer.util".float { border = "single" }
		end
	}
}
}

