require "lspsaga".init_lsp_saga {
	border_style       = "round",
	code_action_prompt = {
		enable        = true,
		sign          = true,
		sign_priority = 20,
		virtual_text  = false
	}
}
