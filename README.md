# Itscarlosecp.nvim

Welcome to my own Neovim configuration files. This config is intended to be clean, simple to undestand, mantain and modify, although I strongly recommend using it as an inspiration for building you own Neovim config.



### Dependencies
- [GCC](https://gcc.gnu.org/): Required by [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) to install and compile language parsers (to improve syntax highlighting).

### Configuration
- **Plugins:** Plugins are managed by [Packer](https://github.com/wbthomason/packer.nvim). To install the plugins after downloading my config files, you must run `:PackerInstall` or `:PackerSync`. You can find the plugins list inside the `plugins.lua` file inside the `nvim` config folder. If you make some changes to this file, you will have to compile the plugins again. Find more information about this in the official documentation.

- **Autocompletion:** Intellisense and autocompletion are provided using the official [Neovim LSP API](https://github.com/neovim/nvim-lspconfig). By default, no language servers are installed, you will have to install them manually using [LSPInstall](https://github.com/kabouzeid/nvim-lspinstall) (ex.: `:LspInstall python`).

- **Formatting:** File auto-formatting is managed by external formatters. This allows you to use any formatting programm you want externally. Formatters can be configured in the `nvim/lua/_formatter/init.lua` file. Remember to add the filetype you want at the autocommands section at the end of this file.
