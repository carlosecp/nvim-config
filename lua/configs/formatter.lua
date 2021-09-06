local prettier_config_path = "$HOME/.config/nvim/utils/.prettierrc"
local function prettier()
	-- npm install -g prettier
  return {
    exe = "prettier",
    args = {
			"--config " .. prettier_config_path,
			vim.api.nvim_buf_get_name(0)
    },
    stdin = true
  }
end

local function gofmt()
	return {
		exe = "gofmt",
		args = {vim.api.nvim_buf_get_name(0)},
		stdin = true
	}
end

local function clang_format()
	return {
		exe = "clang-format",
		args = {vim.api.nvim_buf_get_name(0)},
		stdin = true
	}
end

require "formatter".setup {
  logging = true,
  filetype = {
		c = {clang_format},
		cpp = {clang_format},
    css = {prettier},
    html = {prettier},
    javascript = {prettier},
    javascriptreact = {prettier},
		go = {gofmt},
    typescript = {prettier},
    typescriptreact = {prettier}
  }
}

