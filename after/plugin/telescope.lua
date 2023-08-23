-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				['<C-u>'] = false,
				['<C-d>'] = require('telescope.actions').delete_buffer,
			},
			n = {
				['<C-d>'] = require('telescope.actions').delete_buffer,
			},
		},
		initial_mode = "normal",
	},
	extensions = {
		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = false,
			grouped = true,
			hide_parent_dir = false,
			collapse_dirs = false,
			mappings = {
				["i"] = {
					["<bs>"] = false,
				},
				["n"] = {
					["<bs>"] = false,
				},
			},
		},
	},
}
-- Enable telescope file browser extension
pcall(require("telescope").load_extension, "file_browser")
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').lsp_definitions,
	{ desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', function()
	require 'telescope.builtin'.buffers { on_complete = { function()
		-- vim.cmd "startinsert"
	end } }
end, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })
vim.api.nvim_set_keymap(
	"n",
	"<space>fb",
	":Telescope file_browser path=%:p:h select_buffer=true<CR>",
	{ desc = '[F]ile [B]rowser', noremap = true }
)

vim.keymap.set('n', '<leader>sf', function()
		require 'telescope.builtin'.find_files { hidden = true, on_complete = { function() vim.cmd "startinsert" end } }
	end,
	{ desc = '[S]earch [F]iles', })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', function()
		require 'telescope.builtin'.live_grep { on_complete = { function() vim.cmd "startinsert" end } }
	end,
	{ desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
