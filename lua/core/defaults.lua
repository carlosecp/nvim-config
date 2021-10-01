local defaults = {
	borders = "rounded",
	plugins = {
		telescope = {
			paths = {
				dotfiles = "$HOME/dotfiles",
				neovim   = "$HOME/.config/nvim",
				themes   = "$HOME/themes.nvim"
			},
		},
		ts = {
			parsers = {"c", "cpp", "lua", "json", "jsonc"}
		}
	}
}

local function setup(config)
	for k, v in pairs(config) do defaults[k] = v end
	return defaults
end

return setup
