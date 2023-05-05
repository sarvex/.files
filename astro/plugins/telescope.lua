return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"debugloop/telescope-undo.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"xiyaowong/telescope-emoji.nvim",
		"ghassan0/telescope-glyph.nvim",
		"fcying/telescope-ctags-outline.nvim",
		'olacin/telescope-gitmoji.nvim',
		{ "prochri/telescope-all-recent.nvim", requires = { "kkharji/sqlite.lua" } },
		{ "nvim-telescope/telescope-frecency.nvim", requires = { "kkharji/sqlite.lua" } },
		{
			"edolphin-ydf/goimpl.nvim",
			requires = {
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-lua/popup.nvim" },
				{ "nvim-treesitter/nvim-treesitter" },
			},
		},
		{
			"sudormrfbin/cheatsheet.nvim",
			requires = {
				{ "nvim-lua/popup.nvim" },
				{ "nvim-lua/plenary.nvim" },
			},
			opts = {
				bundled_cheatsheets = true,
				bundled_plugin_cheatsheets = true,
				include_only_installed_plugins = true,
			},
		},
		opts = function(_, opts)
			local actions = require("telescope.actions")
			return require("astronvim.utils").extend_tbl(opts, {
				defaults = {
					selection_caret = "  ",
					layout_config = {
						width = 0.90,
						height = 0.85,
						preview_cutoff = 120,
						horizontal = {
							preview_width = 0.6,
						},
						vertical = {
							width = 0.9,
							height = 0.95,
							preview_height = 0.5,
						},
						flex = {
							horizontal = {
								preview_width = 0.9,
							},
						},
					},
				},
				extensions = {
					ctags_outline = {
						--ctags option
						ctags = { "ctags" },
						--ctags filetype option
						ft_opt = {
							vim = "--vim-kinds=fk",
							lua = "--lua-kinds=fk",
						},
					},
				},
				pickers = {
					buffers = {
						path_display = { "smart" },
						mappings = {
							i = {
								["<c-d>"] = actions.delete_buffer,
								["<Tab>"] = actions.select_default,
							},
							n = {
								["d"] = actions.delete_buffer,
								["<Tab>"] = actions.select_default,
							},
							["<CR>"] = require("cheatsheet.telescope.actions").select_or_fill_commandline,
							["<A-CR>"] = require("cheatsheet.telescope.actions").select_or_execute,
							["<C-Y>"] = require("cheatsheet.telescope.actions").copy_cheat_value,
							["<C-E>"] = require("cheatsheet.telescope.actions").edit_user_cheatsheet,
						},
					},
				},
			})
		end,
		config = function(...)
			require("plugins.configs.telescope")(...)
			local telescope = require("telescope")
			telescope.load_extension("undo")
			telescope.load_extension("file_browser")
			telescope.load_extension("media_files")
			telescope.load_extension("telescope_all_recent")
			telescope.load_extension("frecency")
			telescope.load_extension("emoji")
			telescope.load_extension("glyph")
			telescope.load_extension("goimpl")
			telescope.load_extension("ctags_outline")
			telescope.load_extension("gitmoji")
		end,
	},
}
