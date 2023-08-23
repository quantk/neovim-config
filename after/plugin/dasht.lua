vim.keymap.set({ 'n' }, '<leader>k', ':Dasht!<space>', { desc = 'Dasht search', noremap = true })
vim.keymap.set({ 'n' }, '<leader>K', ':call Dasht(dasht#cursor_search_terms())<Return>',
	{ desc = 'Dasht search under cursor', noremap = true })
