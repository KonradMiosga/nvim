local augroup = vim.api.nvim_create_augroup("config-autocmds", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})
