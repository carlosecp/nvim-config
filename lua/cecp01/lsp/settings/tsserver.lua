local status_ok, ts_utils = pcall(require, "nvim-lsp-ts-utils")
if not status_ok then
	return
end

return {
	init_options = ts_utils.init_options
}
