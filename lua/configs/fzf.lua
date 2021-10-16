require "fzf-lua".setup {
	winopts = {
		border = _G.itscarlosecp.borders,
		hl = { border = "FloatBorder" },
		preview = {
			border = _G.itscarlosecp.borders
		}
	}
}

--- Custom Finders
local F = {}

-- Search inside my dotfiles directory
F.search_dotfiles = function()
	require "fzf-lua".files {
		cwd = _G.itscarlosecp.plugins.fuzzy_finder.paths.dotfiles
	}
end

-- Search inside my Neovim config
F.search_neovim = function()
	require "fzf-lua".files {
		cwd = _G.itscarlosecp.plugins.fuzzy_finder.paths.neovim,
	}
end

return F
