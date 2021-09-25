local palette = {
	vim_mode = {
		fg = "#8fbcbb",
		bg = "#2e3440"
	},
	docs_border = "#434c5e"
}

local N = {}

function N.setup()
	vim.cmd(string.format("hi Mode guifg=yellow guibg=%s", palette.vim_mode.bg))
	vim.cmd(string.format("hi CmpDocumentationBorder guifg=%s", palette.docs_border))
end

return N
