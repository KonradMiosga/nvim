return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"j-hui/fidget.nvim",
		"saghen/blink.cmp",
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {},
		},
	},

	config = function()
		require("fidget").setup({})

		---@module "lspconfig"
		---@type vim.lsp.Config
		local lua_ls_config = {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			root_markers = { ".luarc.json", ".git" },
			---@type lspconfig.settings.lua_ls
			settings = {
				Lua = {
					completion = { callSnippet = "Replace" },
					diagnostics = { globals = { "vim" } },
					workspace = { checkThirdParty = false },
				},
			},
		}

		vim.lsp.config["lua_ls"] = lua_ls_config
		vim.lsp.enable("lua_ls")

		---@type vim.lsp.Config
		local clangd_config = {
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
			},
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
			root_markers = {
				".clangd",
				"compile_commands.json",
				"compile_flags.txt",
				".git",
			},
		}

		vim.lsp.config["clangd"] = clangd_config
		vim.lsp.enable("clangd")

		vim.diagnostic.config({
			virtual_text = {
				spacing = 4,
				prefix = "●", -- could be "■", "▎", ""
			},
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "if_many",
				header = "",
				prefix = "",
			},
		})
	end,
}
