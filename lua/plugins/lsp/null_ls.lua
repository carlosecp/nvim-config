-- null-ls.nvim
-- Use Neovim as a language server to inject LSP diagnostics, code actions, and
-- more via Lua.
-- repo: https://github.com/jose-elias-alvarez/null-ls.nvim

local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then return end
local formatting = null_ls.builtins.formatting

null_ls.setup {
	sources = {
		formatting.clang_format, -- sudo pacman -S clang
		formatting.gofmt,        -- included with go
		formatting.goimports,    -- go install golang.org/x/tools/cmd/goimports@latest
		formatting.prettierd,    -- sudo npm install -g @fsouza/prettierd
		formatting.rustfmt       -- rustfmt (included with rustup)
	},
	on_attach = function()
		require("core.mappings").null_ls()
	end
}
