-- vim.keymap.set('n', '<leader>gf', ':ObsidianFollowLink<CR>')
vim.keymap.set("n", "zf", function()
	if require("obsidian").util.cursor_on_markdown_link() then
		return "<cmd>ObsidianFollowLink<CR>"
	else
		return "gd"
	end
end, { noremap = false, expr = true })
vim.keymap.set("n", "zl", ":ObsidianBacklinks<CR><CR>", { noremap = true, silent = true })
vim.keymap.set("n", "zn", ":ObsidianNew<space>", { noremap = true, silent = true })
vim.keymap.set("v", "zl", function()
	return ":ObsidianLinkNew " .. vim.fn.input("New link name: ") .. "<cr>"
end, { expr = true })
