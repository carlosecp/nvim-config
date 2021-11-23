local builtin    = require "el.builtin"
local extensions = require "el.extensions"
local subscribe  = require "el.subscribe"

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

local function get_cursor_loc()
	local line = builtin.line_with_width(3)
	local column = builtin.column_with_width(2)
	local percentage = builtin.percentage_through_file

	return string.format("%s:%s %s%s ", line, column, percentage, "%%")
end

local function generator()
	local el_segments = {}

	table.insert(el_segments, extensions.mode)
	table.insert(el_segments, "%=")
	-- table.insert(el_segments, get_icon())
	table.insert(el_segments, get_filename())
	table.insert(el_segments, "%=")
	table.insert(el_segments, get_cursor_loc())

	return el_segments
end

require "el".setup { generator = generator }
