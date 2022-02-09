local status_ok, ls = pcall(require, "luasnip")
if not status_ok then return end

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true
})

ls.snippets = {
	all = {},
	lua = {
		ls.parser.parse_snippet("lf", "local $1 = function($2)\n\t$0\nend"),
		ls.parser.parse_snippet("mf", "$1.$2 = function($3)\n\t$0\nend")
	}
}

vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })
