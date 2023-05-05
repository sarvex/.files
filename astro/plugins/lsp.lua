return {
	{
		"p00f/clangd_extensions.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
		opts = function()
			return {
				server = require("astronvim.utils.lsp").config("clangd"),
				extensions = { autoSetHints = false },
			}
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		ft = { "rust" },
		opts = function()
			return { server = require("astronvim.utils.lsp").config("rust_analyzer") }
		end,
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "clangd" }, -- automatically install lsp
		},
	},
	"akinsho/flutter-tools.nvim",
	"simrat39/rust-tools.nvim", -- add lsp plugin
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua-language-server", "rust_analyzer" },
		},
	},
	{ "lvimuser/lsp-inlayhints.nvim", config = true },

	setup_handlers = {
		clangd = function(_, opts)
			require("clangd_extensions").setup({ server = opts })
		end,
		dartls = function(_, opts)
			require("flutter-tools").setup({ lsp = opts })
		end,
	},

	config = {
		clangd = {
			capabilities = {
				offsetEncoding = "utf-8",
			},
		},
		dartls = {
			-- any changes you want to make to the LSP setup, for example
			color = {
				enabled = true,
			},
			settings = {
				showTodos = true,
				completeFunctionCalls = true,
			},
		},
		rust_analyzer = function(_, opts)
			require("rust-tools").setup({ server = opts })
		end,
		denols = function(opts)
			opts.root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
			return opts
		end,
		tsserver = function(opts)
			opts.root_dir = require("lspconfig.util").root_pattern("package.json")
			return opts
		end,
		eslint = function(opts)
			opts.root_dir = require("lspconfig.util").root_pattern(".eslintrc.json", ".eslintrc.js")
			return opts
		end,
	},
	-- customize lsp formatting options
	formatting = {
		-- control auto formatting on save
		format_on_save = {
			enabled = true, -- enable or disable format on save globally
			allow_filetypes = { -- enable format on save for specified filetypes only
				-- 'go',
			},
			ignore_filetypes = { -- disable format on save for specified filetypes
				-- 'python',
			},
		},
		disabled = { -- disable formatting capabilities for the listed language servers
			-- disable lua_ls formatting capability if you want to use StyLua to format your lua code
			-- 'lua_ls',
		},
		timeout_ms = 3000, -- default format timeout
		-- filter = function(client) -- fully override the default formatting function
		--   return true
		-- end
	},
	-- enable servers that you already have installed without mason
	servers = {
		"pyright",
		"dartls",
		"clangd",
	},
}
-- plugins = {

-- }
