# itscarlosecp.nvim

Welcome to my own Neovim configuration files. This config is intended to be clean, simple to undestand, mantain and modify, although I strongly recommend using it as an inspiration for building you own Neovim config.

![neovim](https://user-images.githubusercontent.com/47466248/131421510-8b6aabb6-1480-4938-a6ea-bd5d7f923d44.png)

## Installation

Make shure you have the latest version of Neovim (0.5 or higher) and then install in one command:

```shell
bash <(curl -s https://raw.githubusercontent.com/itscarlosecp/itscarlosecp.nvim/main/utils/install.sh)
```

### Post-Installation

- ⚠️ After downloading this config files, Neovim will be automatically opened and will probably show a bunch of error (because plugins are not installed yet). To fix this just press <kbd>Enter</kbd> to skip the error messages and then the plugins should be automatically installed.
- ⏱️ When you do this open your very first file after installing the plugins, Neovim will start downloading language parsers and will aparently freeze for a few seconds.

## Customization

### Settings & Mappings
Vim settings and mappings are split in two files: `settings.lua` and `mappings.lua`.

### Plugins
Plugins listed in the `plugins/init.lua` file are managed by [Packer](https://github.com/wbthomason/packer.nvim). To install the plugins you must run `:PackerInstall` or `:PackerSync`. If you make some changes to this file, you will have to compile the plugins again by running `:PackerCompile` or re-running `:PackerSync`. Find more information about this in the official documentation.

### Formatting
File auto-formatting is managed by external formatter programs. This allows you to use any formatting programm you want externally. Formatters can be configured in the `formatter/init.lua` file. Remember to add the filetype you want at the autocommands section at the end of this file if you want autoformatting.
