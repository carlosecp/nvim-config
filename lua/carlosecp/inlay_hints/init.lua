local namespace = vim.api.nvim_create_namespace("rust-analyzer/inlayHints")
local enabled = false

local get_params = function()
	return { textDocument = vim.lsp.util.make_text_document_params() }
end

-- Basically creates a table of hints.
local parse_hints = function(result)
	local map = {}

	if type(result) ~= "table" then return {} end
	for _, value in pairs(result) do
		local range = value.range
		local line = tostring(range["end"].line)
		local label = value.label
		local kind = value.kind

		if map[line] ~= nil then
			-- Update a line that already has hints. Add more hints to this table,
			-- an take it as a hints per line array.
			table.insert(map[line], { label = label, kind = kind, range = range })
		else
			-- Create a new entry for a new line.
			map[line] = {{ label = label, kind = kind, range = range }}
		end
	end
	return map
end

-- :h lsp-handler
local handler = function(err, result, ctx)
	if err then return end

	local bufnr = ctx.bufnr

	if (vim.api.nvim_get_current_buf() ~= bufnr) then return end

	local ret = parse_hints(result)

	for key, value in pairs(ret) do
		local virt_text = ""
		local line = tonumber(key)

		local current_line = vim.api.nvim_buf_get_lines(bufnr, line, line + 1, false)[1]

		if (current_line) then
			local current_line_len = string.len(current_line)
			local param_hints = {}
			local other_hints = {}

			-- Each of the hints of the current line. Here we separate ParameterHints
			-- from OtherHints.
			for _, value_inner in ipairs(value) do
				if value_inner.kind == "ParameterHint" then
					table.insert(param_hints, value_inner.label)
				else
					table.insert(other_hints, value_inner)
				end
			end
			
			-- Show parameter hints inside brackets with commas.
-- 			if not vim.tbl_isempty(param_hints) then
-- 				virt_text = virt_text .. " -> " .. "("
-- 				for i, value_inner_inner in ipairs(param_hints) do
-- 					virt_text = virt_text .. value_inner_inner
-- 					if i ~= #param_hints then
-- 						virt_text = virt_text .. ", "
-- 					end
-- 				end
-- 				virt_text = virt_text .. ")"
-- 			end

			-- Show other hints with commas and a double arrow.
			if not vim.tbl_isempty(other_hints) then
				virt_text = virt_text .. " >> "
				for i, value_inner_inner in ipairs(other_hints) do
					if value_inner_inner.kind == "TypeHint" then
						local char_start = value_inner_inner.range.start.character
						local char_end = value_inner_inner.range["end"].character
						local variable_name = string.sub(current_line, char_start + 1, char_end)
						virt_text = virt_text .. variable_name .. ": " .. value_inner_inner.label
					else
						virt_text = virt_text .. value_inner_inner.label
					end
					if i ~= #other_hints then
						virt_text = virt_text .. ", "
					end
				end
			end

			-- Set virtual text
			vim.api.nvim_buf_set_extmark(bufnr, namespace, line, 0, {
				virt_text_pos = "eol",
				virt_text = {{ virt_text, "Comment" }},
				hl_mode = "combine"
			})
		end
	end
end

local M = {}

-- Send a request to the server attached to this buffer for the
-- rust-analyzer/inlayHints method, and use a custom LSP handler.
M.set_inlay_hints = function()
	M.disable_inlay_hints()
	vim.lsp.buf_request(0, "rust-analyzer/inlayHints", get_params(), handler)
end

M.disable_inlay_hints = function()
	vim.api.nvim_buf_clear_namespace(0, namespace, 0, -1)
end

return M
