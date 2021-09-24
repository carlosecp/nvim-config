local palette = {
	vim_mode = "#2e3440",
	docs_border = "#434c5e"
}

local N = {}

function N.setup()
	vim.cmd(string.format("hi Mode guibg=%s", palette.vim_mode))
	vim.cmd(string.format("hi CmpDocumentationBorder guifg=%s", palette.docs_border))
end

return N
