local status_ok_ls, ls  = pcall(require, "luasnip")

if not status_ok_ls then return end

local s   = ls.snippet
local i   = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

local utils = require("core.utils")
local map = utils.map

ls.config.set_config({
	enable_autosnippets = true,
	history = true,
	updateevents = "TextChanged,TextChangedI"
})

ls.add_snippets(nil, {
	all = {},
	lua = {
		s("req", fmt('local {} = require("{}")', {
			i(1, "module"),
			rep(1)
		})),
		s("preq", fmt('local status_ok_{}, {} = pcall(require, "{}")', {
			i(1, "module"),
			-- TODO: Try to make this invisible???
			rep(1),
			rep(1)
		})),
		s("lf", fmt('local function {}({})\n\t{}\nend', {
			i(1, "identifier"),
			i(2, "args"),
			i(0)
		})),
		s("mf", fmt('function {}.{}({})\n\t{}\nend', {
			i(1, "M"),
			i(2, "method"),
			i(3, "args"),
			i(0)
		}))
	}
})

map({ "i", "s" }, "<C-j>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end)

map({ "i", "s" }, "<C-k>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end)
