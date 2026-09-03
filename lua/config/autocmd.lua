local augroup = vim.api.nvim_create_augroup("config-autocmds", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Start treesitter highlighting when available",
	group = augroup,
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})
