local hop = require('hop')
vim.keymap.set('', 'f', function()
	hop.hint_char1({ current_line_only = false })
end)
