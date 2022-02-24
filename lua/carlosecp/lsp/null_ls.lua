local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		formatting.prettierd.with({ extra_filetypes = { "svelte" } }), -- sudo npm install -g @fsouza/prettierd
		formatting.clang_format,                                       -- sudo pacman -S clang
		formatting.gofmt,                                              -- included with go
		formatting.goimports,                                          -- go install golang.org/x/tools/cmd/goimports@latest
		formatting.rustfmt                                             -- rustfmt (included with rustup)
	},
	on_attach = function()
		require("carlosecp.keymappings").null_ls()
	end
})
