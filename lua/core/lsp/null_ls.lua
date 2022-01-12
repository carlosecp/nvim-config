local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting

null_ls.setup {
	sources = {
		formatting.prettierd,    -- sudo npm install -g @fsouza/prettierd
		formatting.clang_format, -- sudo pacman -S clang
		formatting.gofmt,        -- included with go
		formatting.autopep8,     -- pip install autopep8
		formatting.rustfmt       -- rustfmt
	}
}
