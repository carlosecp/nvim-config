local function defineSings(signs)
	for sign_name, icon in ipairs(signs) do
		vim.fn.sign_define(sign_name, {
			texthl = sign_name,
			text = icon,
			numhl = sign_name
		})
	end
end

local signs = {
  LspDiagnosticsSignError = "",
  LspDiagnosticsSignWarning = "",
  LspDiagnosticsSignHint = "",
  LspDiagnosticsSignInformation = "",
}

defineSings(signs)

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    signs     = true,
    underline = true,
    virtual_text = {
      prefix  = "",
      spacing = 0
    },
		update_in_insert = true
  }
)

vim.lsp.protocol.CompletionItemKind = {
  "   (Text)",
  "   (Method)",
  "   (Function)",
  "   (Constructor)",
  " ﴲ  (Field)",
  "[] (Variable)",
  "   (Class)",
  " ﰮ  (Interface)",
  "   (Module)",
  " 襁 (Property)",
  "   (Unit)",
  "   (Value)",
  " 練 (Enum)",
  "   (Keyword)",
  "   (Snippet)",
  "   (Color)",
  "   (File)",
  "   (Reference)",
  "   (Folder)",
  "   (EnumMember)",
  " ﲀ  (Constant)",
  " ﳤ  (Struct)",
  "   (Event)",
  "   (Operator)",
  "   (TypeParameter)"
}

