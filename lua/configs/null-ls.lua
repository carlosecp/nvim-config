local nulls  = require "null-ls"
local commons = require "modules.lsp.commons"

nulls.config {
	debug = true,
	sources = {
				nulls.builtins.formatting.stylua
	}
}

