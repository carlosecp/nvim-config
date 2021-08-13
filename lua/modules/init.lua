--  Automatically install Packer if its missing
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
	execute "packadd packer.nvim"
end

return require "packer".startup(function(use)
	-- LSP
	use {
		"neovim/nvim-lspconfig",
		config = function()
			require "lsp.utils"
		end
	}
	use {
		"kabouzeid/nvim-lspinstall",
		config = function()
			require "lsp"
		end
	}
	use {
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require "null-ls".setup {
				on_attach = function(client)
					client.resolved_capabilities.document_formatting = true
					if client.resolved_capabilities.document_formatting then
						vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
					end
				end
			}
		end
	}

	-- Treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		config = function()
			require "modules.treesitter"
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
			require "modules.compe"
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

	-- Nvimtree
	use {
		"kyazdani42/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		config = function()
			require "modules.nvimtree"
		end
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
			require "modules.telescope"
		end
	}

	-- Colorscheme
	use {
		"projekt0n/github-nvim-theme",
		config = function()
			require "colors"
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
			require "modules.devicons"
		end
	}

	-- Packer can manage itself
	use "wbthomason/packer.nvim"
end)

