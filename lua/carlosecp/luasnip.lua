local ls = require("luasnip")
local s   = ls.snippet
local sn  = ls.snippet_node
local isn = ls.indent_snippet_node
local t   = ls.text_node
local i   = ls.insert_node
local f   = ls.function_node
local c   = ls.choice_node
local d   = ls.dynamic_node
local r   = ls.restore_node
local events = require("luasnip.util.events")
local ai     = require("luasnip.nodes.absolute_indexer")
local rep    = require("luasnip.extras").rep
local fmt    = require("luasnip.extras.fmt").fmt

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true
})

ls.snippets = {
	all = {},
	lua = {
		s("lf", fmt("local {} = function({})\n\t{}\nend", { i(1, "identifier"), i(2, "args"), i(0) })),
		s("mf", fmt("{}.{} = function({})\n\t{}\nend", { i(1, "M"), i(2, "method"),i(3, "args"), i(0) }))
	}
}

-- Tab to jump between snippet fields.
vim.keymap.set({ "i", "s" }, "<C-j>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })
