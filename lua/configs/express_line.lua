local builtin        = require "el.builtin"
local extensions     = require "el.extensions"
local sections       = require "el.sections"
local subscribe      = require "el.subscribe"

local git_branch = subscribe.buf_autocmd(
"el_git_branch",
"BufEnter",
function(window, buffer)
	local branch = extensions.git_branch(window, buffer)
	if branch then return " " .. branch end
end
)

local file_icon = subscribe.buf_autocmd(
"el_file_icon",
"BufRead",
function (_, buffer)
	return extensions.file_icon(_, buffer) .. " "
end
)

local function cursor_location()
	return "[" .. builtin.line_with_width(3) .. ":" .. builtin.column_with_width(2) .. "]"
end

require "el".setup {
	generator = function()
		local segments = {}

		local mode = extensions.gen_mode { format_string = " %s " }

		table.insert(segments, mode)
		table.insert(segments, git_branch)

		table.insert(segments, sections.split)
		table.insert(segments, file_icon)
		table.insert(segments, builtin.file_relative)
		table.insert(segments, sections.split)

		table.insert(segments, cursor_location)
		table.insert(segments, builtin.percentage_through_file)
		table.insert(segments, "%%")

		return segments
	end
}
