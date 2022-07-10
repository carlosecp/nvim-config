local status_ok, null_ls = pcall(require, "null-ls")

if not status_ok then return end

local mappings = require("core.mappings")
local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		formatting.clang_format, -- sudo pacman -S clang
		formatting.gofmt,        -- included with go
		formatting.goimports,    -- go install golang.org/x/tools/cmd/goimports@latest
		formatting.prettierd,    -- sudo npm install -g @fsouza/prettierd
		formatting.rustfmt       -- rustfmt (included with rustup)
	},
	on_attach = function(client, bufnr)
		mappings.null_ls()
	end
})
