local null_ls = require "null-ls"
null_ls.setup {
    sources = {
			-- null_ls.builtins.formatting.prettier,     -- npm install -g prettier
			null_ls.builtins.formatting.prettierd,    -- npm install -g @fsouza/prettierd
			null_ls.builtins.formatting.clang_format, -- sudo pacman -S clang
			null_ls.builtins.formatting.gofmt,        -- included with go
      null_ls.builtins.formatting.autopep8,     -- pip install autopep8
      null_ls.builtins.formatting.rustfmt       -- rustfmt
		}
}
