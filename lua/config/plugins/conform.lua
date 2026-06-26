return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				objc = { "clang_format" },
				objcpp = { "clang_format" },
			},
			lsp_format = { "fallback" },
		})
		vim.keymap.set("n", "<leader>f", require("conform").format, {})
	end,
}
