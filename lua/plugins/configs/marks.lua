local status_ok_marks, marks = pcall(require, "marks")
if not status_ok_marks then return end

marks.setup({
	signs = true
})
