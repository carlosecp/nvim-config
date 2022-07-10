local status_ok_ls, ls  = pcall(require, "luasnip")

if not status_ok_ls then return end

local s   = ls.snippet
local t   = ls.text_node
local i   = ls.insert_node
local f   = ls.function_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

ls.config.set_config {
	enable_autosnippets = true,
	history = true,
	updateevents = "TextChanged,TextChangedI"
}

ls.add_snippets(nil, {
	all = {},
	lua = {
		s("req", fmt("local {} = require(\"{}\")", { i(1, "module"), rep(1) })),
		s("lf", fmt("local {} = function({})\n\t{}\nend", { i(1, "identifier"), i(2, "args"), i(0) })),
		s("mf", fmt("{}.{} = function({})\n\t{}\nend", { i(1, "M"), i(2, "method"),i(3, "args"), i(0) }))
	},
	-- rust = {
	-- 	s("print", fmt("println!(\"{:?}\"), {}"))
	-- }
})
