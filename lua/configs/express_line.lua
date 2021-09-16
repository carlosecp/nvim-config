local extensions = require "el.extensions"
local subscribe = require "el.subscribe"

require "el".setup {
	generator = function()
		local segments = {}

		table.insert(segments, extensions.mode)
		table.insert(segments, subscribe.buf_autocmd(
			"el_git_branch",
			"BufEnter",
			function(window, buffer)
				local branch = extensions.git_branch(window, buffer)
				if branch then return " " .. branch end
			end
		))


		table.insert(segments, subscribe.buf_autocmd(
			"el_git_status",
			"BufWritePost",
			function(window, buffer)
				local changes = extensions.git_changes(window, buffer)
				if changes then return changes end
			end
		))

		return segments
	end
}
