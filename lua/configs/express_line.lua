local builtin    = require "el.builtin"
local extensions = require "el.extensions"
local sections   = require "el.sections"
local subscribe  = require "el.subscribe"

local git_branch = subscribe.buf_autocmd(
"el_git_branch",
"BufEnter",
function(window, buffer)
	local branch = extensions.git_branch(window, buffer)
	if branch then return "  " .. branch .. " " end
end
)

local file_icon = subscribe.buf_autocmd(
"el_file_icon",
"BufRead",
function (_, buffer)
	return extensions.file_icon(_, buffer)
end
)

local function file_info(segments)
	table.insert(segments, file_icon)
	table.insert(segments, " ")
	table.insert(segments, builtin.shortened_file)
end

local function cursor_location(segments)
	table.insert(segments, "[" .. builtin.line_with_width(3) .. ":" .. builtin.column_with_width(2) .. "]")
	table.insert(segments, "[" .. builtin.percentage_through_file .. "%%" .. "]")
end

local function generator()
	local segments = {}

	table.insert(segments, extensions.mode)
	table.insert(segments, git_branch)

	table.insert(segments, sections.split)
	file_info(segments)
	table.insert(segments, sections.split)

	cursor_location(segments)

	return segments
end

require "el".setup { generator = generator }
