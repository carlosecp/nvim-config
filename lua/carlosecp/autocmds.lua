local create_augroup = function(name)
	return vim.api.nvim_create_augroup(name, { clear = true })
end

local prettierc_group = create_augroup("PrettierRC")
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = ".prettierc",
	callback = function()
		vim.bo.filetype = "json"
	end,
	group = prettierc_group
})

local mdx_group = create_augroup("MDXasMD")
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "markdown",
	callback = function()
		vim.bo.colorcolumn = "80"
	end,
	group = mdx_group
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.mdx",
	callback = function()
		vim.bo.filetype = "markdown"
	end,
	group = mdx_group
})
