local ls = require("luasnip")
local s   = ls.snippet
local t   = ls.text_node
local i   = ls.insert_node
local f   = ls.function_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true
})

ls.snippets = {
	all = {},
	go = {
		s("reterr", {
			f(function(args, snip)
				local defaults = {
					int = "0",
					float64 = "0.0",
					boolean = "false"
				}
				local return_type = require("carlosecp.return_type").get()

				local snippet_str = ""
				local prefix = ""
				for i, t in ipairs(return_type) do
					snippet_str = snippet_str ..  prefix .. defaults[t]
					prefix = ", "
				end

				return "return " .. snippet_str
			end, {}),
			i(0)
		})
	},
	lua = {
		s("req", fmt("local {} = require(\"{}\")", { i(1, "module"), rep(1) })),
		s("lf", fmt("local {} = function({})\n\t{}\nend", { i(1, "identifier"), i(2, "args"), i(0) })),
		s("mf", fmt("{}.{} = function({})\n\t{}\nend", { i(1, "M"), i(2, "method"),i(3, "args"), i(0) }))
	}
}

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
