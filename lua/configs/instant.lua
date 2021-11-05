vim.g.instant_username = "itscarlosecp"
local instant = require "instant"

local function get_server_handle_current_buffer()
  local server_buffers = instant.get_connected_buf_list()
  local current_buffer = vim.api.nvim_buf_get_number(0)
  local curr = 0
  for index, buffer in ipairs(server_buffers) do
    if (buffer == current_buffer) then
      curr = index
    end
  end
  return curr
end

save_server_buffer = function()
  return instant.send_data {
		buffer_handle = get_server_handle_current_buffer(),
		command = "write", type = "bufcommand"
	}
end
