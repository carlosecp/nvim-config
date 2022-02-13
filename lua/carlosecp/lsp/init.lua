local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then return end

require("carlosecp.lsp.lsp_installer")
require("carlosecp.lsp.diagnostics").setup()
require("carlosecp.lsp.null_ls")
