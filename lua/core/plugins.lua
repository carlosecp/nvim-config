--  Automatically install Packer if its missing
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system {
		"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path}
	execute "packadd packer.nvim"
end

return require "packer".startup(function(use)
	-- ### Language Server Protocol
	-- ### Autocompletion
	use "neovim/nvim-lspconfig"
	use "kabouzeid/nvim-lspinstall"
	use {
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require "configs.cmp"
		end,
		requires = {
			-- nvim-cmp modules to provide completion sources
			{ "hrsh7th/vim-vsnip",    after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer",   after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path",     after = "nvim-cmp" }
		}
	}

	-- ### Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		config = function()
			require "configs.treesitter"
		end,
		run = ":TSUpdate",
		requires = {
			-- Treesitter modules
			-- https://github.com/nvim-treesitter/nvim-treesitter#available-modules
			{ "nvim-treesitter/playground",               after = "nvim-treesitter" },
			{ "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" },
			{ "p00f/nvim-ts-rainbow",                     after = "nvim-treesitter" }
		}
	}

	-- ### NvimTree
	-- use {
		-- "kyazdani42/nvim-tree.lua",
		-- cmd = "NvimTreeToggle",
		-- config = function()
			-- require "configs.nvimtree"
		-- end,
		-- setup = function()
			-- require "core.mappings".nvimTree()
		-- end
	-- }

	-- Statusline
	-- use {
		-- "hoob3rt/lualine.nvim",
		-- config = function()
			-- require "configs.lualine"
		-- end
	-- }
	-- use {
		-- "tjdevries/express_line.nvim",
		-- config = function()
			-- require "configs.express_line"
		-- end
	-- }

	-- ### Telescope
	-- use {
		-- "nvim-telescope/telescope.nvim",
		-- cmd = "Telescope",
		-- module = {
			-- "telescope",
			-- "telescope.builtin",
			-- "configs.telescope"
		-- },
		-- config = function()
			-- require "configs.telescope"
		-- end,
		-- setup = function()
			-- require "core.mappings".telescope()
		-- end,
		-- requires = {{
			-- "nvim-telescope/telescope-fzf-native.nvim",
			-- run = "make"
		-- }}
	-- }

	-- ### Formatter
	-- Formatters must be installed separately
	use {
		"mhartington/formatter.nvim",
		cmd = "Format",
		config = function()
			require "configs.formatter"
		end
	}

	-- ### Colorscheme
	-- use {
		-- "$HOME/themes.nvim",
		-- requires = {"rktjmp/lush.nvim"}
	-- }
	use "shaunsingh/nord.nvim"

	-- ### Utilities
	-- Useful vim utilities
	use {
		"tpope/vim-surround",
		keys = {
			{"v", "S"}
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
		event = "BufReadPre",
		config = function()
			require "colorizer".setup()
		end
	}

	-- ### Modules
	-- Helps with lazy-loading
	-- use {
		-- "nvim-lua/popup.nvim",
		-- module = "popup"
	-- }
	-- use {
		-- "nvim-lua/plenary.nvim",
		-- module = "plenary"
	-- }
	-- use {
		-- "kyazdani42/nvim-web-devicons",
		-- module = "nvim-web-devicons",
		-- config = function()
			-- require "configs.devicons"
		-- end
	-- }

	-- Packer can manage itself
	use "wbthomason/packer.nvim"
end)

