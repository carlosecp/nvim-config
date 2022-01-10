# nvim

My personal neovim configuration written in Lua. This requires neovim version
0.6 and up.

## Installation

Simply clone this repo and then run `nvim +PackerSync`, this is equivalent to
opening neovim and then running the `:PackerSync` command. When opening the
first buffer after the installation, you'll feel neovim a little bit laggy,
this is because treesitter stars installing every parser. This will only happen
once until treesitter updates any parser.
