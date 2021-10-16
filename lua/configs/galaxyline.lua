local gl        = require "galaxyline"
local gls       = gl.section
local condition = require "galaxyline.condition"

gl.short_line_list = { "NvimTree", "packer" }

local colors = {
	bg          = "#2e3440",
	fg          = "#e5e9f0",
	section_bg  = "#434c5e",
	section_bg2 = "#4c566a",
	yellow      = "#ebcb8b",
	cyan        = "#8fbcbb",
	darkblue    = "#81a1c1",
	green       = "#a3be8c",
	orange      = "#d08770",
	magenta     = "#bf616a",
	blue        = "#5e81ac",
	red         = "#bf616a",
}

local mode_color = function()
	local mode_colors = {
		n = colors.cyan,
		i = colors.green,
		c = colors.orange,
		v = colors.magenta,
		V = colors.magenta,
		[""] = colors.magenta,
		R = colors.red
	}

	local color = mode_colors[vim.fn.mode()]
	if color == nil then color = colors.red end
	return color
end

table.insert(gls.left, {
	ViMode = {
		provider = function()
			vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color())
			return "█"
		end,
		highlight = { colors.bg, colors.bg },
		separator = " ",
		separator_highlight = { colors.section_bg2, colors.section_bg2 },
	}
})

table.insert(gls.left, {
	FileName = {
		provider = "FileName",
		highlight = { colors.fg, colors.section_bg2 },
		separator = " ",
		separator_highlight = { colors.section_bg2, colors.section_bg },
	}
})

gls.left[4] = {
	GitIcon = {
		provider = function()
			return "  "
		end,
		condition = condition.check_git_workspace,
		highlight = { colors.red, colors.section_bg },
	},
}

gls.left[5] = {
	GitBranch = {
		provider = function()
			local vcs = require "galaxyline.providers.vcs"
			local branch_name = vcs.get_git_branch()
			if string.len(branch_name) > 28 then
				return string.sub(branch_name, 1, 25) .. "..."
			end
			return branch_name .. " "
		end,
		condition = condition.check_git_workspace,
		highlight = { colors.fg, colors.section_bg },
	},
}

gls.left[6] = {
	DiffAdd = {
		provider = "DiffAdd",
		condition = condition.check_git_workspace,
		icon = " ",
		highlight = { colors.green, colors.section_bg },
	},
}

gls.left[7] = {
	DiffModified = {
		provider = "DiffModified",
		condition = condition.check_git_workspace,
		icon = " ",
		highlight = { colors.orange, colors.section_bg },
	},
}

gls.left[8] = {
	DiffRemove = {
		provider = "DiffRemove",
		condition = condition.check_git_workspace,
		icon = " ",
		highlight = { colors.red, colors.section_bg },
	},
}

gls.left[9] = {
	LeftEnd = {
		provider = function()
			return " "
		end,
		highlight = { colors.bg, colors.section_bg },
	},
}

gls.left[10] = {
	DiagnosticError = {
		provider = "DiagnosticError",
		icon = "  ",
		highlight = { colors.red, colors.bg },
	},
}

gls.left[11] = {
	Space = {
		provider = function()
			return " "
		end,
		highlight = { colors.section_bg, colors.bg },
	},
}

gls.left[12] = {
	DiagnosticWarn = {
		provider = "DiagnosticWarn",
		icon = "  ",
		highlight = { colors.orange, colors.bg },
	},
}

gls.left[13] = {
	DiagnosticHint = {
		provider = "DiagnosticHint",
		icon = "  ",
		highlight = { colors.fg, colors.bg },
	},
}

gls.left[14] = {
	Space = {
		provider = function()
			return " "
		end,
		highlight = { colors.bg, colors.bg },
	},
}

gls.left[15] = {
	DiagnosticInfo = {
		provider = "DiagnosticInfo",
		icon = "  ",
		highlight = { colors.blue, colors.bg },
		separator = " ",
		separator_highlight = { colors.bg, colors.bg },
	},
}

-- Right side
gls.right[1] = {
	LineInfo = {
		provider = "LineColumn",
		highlight = { colors.fg, colors.section_bg },
		separator = "  ",
		separator_highlight = { colors.section_bg, colors.bg },
	},
}

gls.right[2] = {
	Logo = {
		provider = function()
			return "  "
		end,
		highlight = { colors.red, colors.section_bg2 },
		separator = "  ",
		separator_highlight = { colors.section_bg2, colors.section_bg },
	},
}

