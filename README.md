# nvim

My personal neovim configuration written in Lua. This requires neovim version
0.6 and up.

## Installation

Simply run the following command to clone this repo to the default location
and install my plugins:

```bash
git clone https://github.com/cecp01/nvim.git $HOME/.config/nvim
nvim +PackerSync
```

The latter command is equivalent to opening neovim and then running the
`:PackerSync` command. When opening the first buffer after the installation,
you'll feel neovim a little bit laggy, this is because treesitter stars
installing every parser available. This will only happen once until treesitter
updates any parser.
