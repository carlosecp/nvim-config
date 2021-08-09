-- Currently not using real time diagnostic lists
local M = {}

M.show_diagnostics = function()
	local errors_count = vim.lsp.diagnostic.get_count(0, "Error")
	local warnings_count = vim.lsp.diagnostic.get_count(0, "Warning")

	if errors_count + warnings_count ~= 0 then
		require "vimway-lsp-diag".open_buffer_diagnostics()
	else
		print("No diagnostics available")
	end
end

return M
