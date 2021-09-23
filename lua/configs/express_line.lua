local builtin    = require "el.builtin"
local extensions = require "el.extensions"
local sections   = require "el.sections"
local subscribe  = require "el.subscribe"

local git_branch = subscribe.buf_autocmd(
"el_git_branch", "BufEnter",
function(window, buffer)
	local branch = extensions.git_branch(window, buffer)
	if branch then return string.format("  %s ", branch) end
end)

local function get_icon()
	return subscribe.buf_autocmd(
	"el_file_icon", "BufRead",
	function(_, buffer)
		return extensions.file_icon(_, buffer)
	end)
end

local function get_filename()
	return " %t "
end

local function cursor_location()
	local line       = builtin.line_with_width(3)
	local column     = builtin.column_with_width(2)
	local percentage = builtin.percentage_through_file

	return string.format("[%s:%s][%s%s]", line, column, percentage, "%%")
end

local function generator()
	local segments = {
		extensions.mode, git_branch,
		"%=", get_icon(), get_filename(), "%=",
		cursor_location()
	}

	return segments
end

require "el".setup { generator = generator }
