# itscarlosecp.nvim

Welcome to my own Neovim configuration files. This config is intended to be clean, simple to undestand, mantain and modify, although I strongly recommend using it as an inspiration for building you own Neovim config.

![itscarlosecp_nvim](https://user-images.githubusercontent.com/47466248/129460312-47b37d03-6307-4196-8d82-57f82d7d6886.png)

## Installation

Make shure you have the latest version of Neovim (0.5 or higher) and then install in one command:

```shell
bash <(curl -s https://raw.githubusercontent.com/itscarlosecp/itscarlosecp.nvim/main/utils/install.sh)
```

### Post-Installation

- ⚠️ After downloading this config files, Neovim will be automatically opened and will probably show a bunch of error (because plugins are not installed yet). To fix this just press <kbd>Enter</kbd> to skip the error messages and then the plugins should be automatically installed.
- ⏱️ When you do this open your very first file after installing the plugins, Neovim will start downloading language parsers and will aparently freeze for a few seconds.

## Features

- Syntax Highlighting
  - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Improved syntax highlighting when using a compatible colorscheme.
- Autocompletion
  - [nvim-lspinstall](https://github.com/kabouzeid/nvim-lspinstall) - Easily install autocompletion and diagnostics support for your favourite language.
  - [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim) - Pretty interface for dealing with diagnostics.
  - [nvim-compe](https://github.com/hrsh7th/nvim-compe) - Fast interface for interacting with LSP suggestions.
- Interface
  - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Performant fuzzy finder.
  - [lualine.nvim](https://github.com/hoob3rt/lualine.nvim) - Customizable and fast statusline.
- Others
  - [vim-carbon-now-sh](https://github.com/kristijanhusak/vim-carbon-now-sh) - Screenshot you code with CarbonNowSh.
  - [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) - Highlight color codes in your files.
  - [vim-easy-align](https://github.com/junegunn/vim-easy-align) - Elegant indentation for you code.
  - [vim-surround](https://github.com/tpope/vim-surround) - Add, remove or change a word's surroundings.

## Customization

### Settings & Mappings
Vim settings and mappings are split in two files: `settings.lua` and `mappings.vim`. This was intented to be this way because it is easier to manager keymappings from VimScript. This also allows you to modify the default keybinds easily. On the other hand, Vim settings are configured in Lua.

### Plugins
Plugins listed in the `plugins.lua` file are managed by [Packer](https://github.com/wbthomason/packer.nvim). To install the plugins you must run `:PackerInstall` or `:PackerSync`. If you make some changes to this file, you will have to compile the plugins again by running `:PackerCompile` or re-running `:PackerSync`. Find more information about this in the official documentation.

### Autocompletion
Intellisense and autocompletion are provided using the official [Neovim LSP API](https://github.com/neovim/nvim-lspconfig). By default, no language servers are installed, you will have to install them manually using [LSPInstall](https://github.com/kabouzeid/nvim-lspinstall) (ex.: `:LspInstall python`).

### Formatting
File auto-formatting is managed by external formatter programs. This allows you to use any formatting programm you want externally. Formatters can be configured in the `_formatter/init.lua` file. Remember to add the filetype you want at the autocommands section at the end of this file if you want autoformatting.
