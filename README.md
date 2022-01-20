# nvim

My personal neovim configuration written in Lua. This requires neovim version
0.6 and up.

## Installation

Simply run the following command to clone this repo to the default location and
install my plugins:

```bash
git clone https://github.com/carlosecp/nvim.git $HOME/.config/nvim
nvim +PackerSync
```

The latter command is equivalent to opening neovim and then running
`:PackerSync` from within neovim. When opening the first buffer after the
installation, you'll feel neovim a little bit laggy, this is because treesitter
stars installing every parser available. This will only happen once until
treesitter updates any parser. 

## LSP

This configuration uses neovim native-lsp client to support various language
servers (if you are comming from something like VSCode, think about language
servers as language extensions, under the hood that's exactly what they are).
The add support for a language, run the `:LspInstall <server-name>` command
with the name of the server for your language. You can checkout the list of
available servers per language
[here](https://github.com/williamboman/nvim-lsp-installer#available-lsps).

Since I don't really use autocompletion and diagnostics features that much, by
default LSP is deactivated so loading the servers doesn't have and impact on
neovim startup time. To activate LSP run the `:LspStart` command when you want
to enable it.
