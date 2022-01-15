if not _G.cecp01.lsp.active then return end

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require "cecp01.lsp.lsp_installer"
require "cecp01.lsp.handlers".setup()
require "cecp01.lsp.null_ls"
