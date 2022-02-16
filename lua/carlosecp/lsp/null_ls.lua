local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

null_ls.setup({
    sources = {
			formatting.prettierd.with({ -- sudo npm install -g @fsouza/prettierd
				extra_filetypes = { "svelte" }
			}),
			formatting.clang_format, -- sudo pacman -S clang
			formatting.gofmt,        -- included with go
			formatting.rustfmt       -- rustfmt (included with rustup)
    },
		on_attach = function()
			require("carlosecp.keymappings").null_ls_keymappings()
		end
})
