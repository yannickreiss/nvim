local M = {}

-- Delete area in between the current and next occurrence of the current symbol under cursor.
-- use builtin functionality for opening brackets
function M.Delete_interval()
	-- TODO: Think of something
end

-- resize current window using control + 7,8,9,0
function M.Resize_Current_Window(change_width, change_height)
	local width = vim.api.nvim_win_get_width(0)
	local height = vim.api.nvim_win_get_height(0)

	if width + change_width > 5 then
		vim.api.nvim_win_set_width(0, width + change_width)
	end

	if height + change_height > 5 then
		vim.api.nvim_win_set_height(0, height + change_height)
	end
end

-- Keybindings
-- 7/8 change width
-- 9/0 change height
--vim.keymap.set("n", "<C-7>", Resize_Current_Window(-1, 0))
--vim.keymap.set("n", "<C-8>", Resize_Current_Window(1, 0))
--vim.keymap.set("n", "<C-9>", Resize_Current_Window(0, -1))
--vim.keymap.set("n", "<C-0>", Resize_Current_Window(0, 1))

return M
