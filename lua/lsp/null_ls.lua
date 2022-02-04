local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

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
			require("core.bindings").null_ls()
		end
})
