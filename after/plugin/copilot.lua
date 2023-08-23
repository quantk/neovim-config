vim.api.nvim_set_keymap('i', '<A-j>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.copilot_no_tab_map = true
-- Disable Copilot by default
vim.g.copilot_enabled = false
