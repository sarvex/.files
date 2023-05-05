-- customize mason plugins
return {
	-- use mason-lspconfig to configure LSP installations
	{
		"williamboman/mason-lspconfig.nvim",
		-- overrides `require('mason-lspconfig').setup(...)`
		opts = function(_, opts)
			opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
				"clangd",
				"html",
				"neocmake",
				"jsonls",
				"pyright",
				"lua_ls",
			})
		end,
	},
	-- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
	{
		"jay-babu/mason-null-ls.nvim",
		-- overrides `require('mason-null-ls').setup(...)`
		opts = function(_, opts)
			opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
				"prettier",
				"black",
				"stylua",
			})
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		-- overrides `require("mason-nvim-dap").setup(...)`
		opts = function(_, opts)
			opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
				"python",
				"lua"
			})
		end,
	},
}
