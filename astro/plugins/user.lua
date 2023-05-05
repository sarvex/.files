return {
	{ "goolord/alpha-nvim", enabled = false, },
	{ "wsdjeg/vim-fetch", lazy = false, },
	{ "nyoom-engineering/oxocarbon.nvim", },
	{ "kvrohit/mellow.nvim",	},
	
	{
		"gen740/SmoothCursor.nvim",
		cond = vim.g.neovide == nil,
		lazy = false,
		opts = {
			autostart = true,
			fancy = { enable = true },
		},
	},

	{
		"zbirenbaum/neodim",
		event = "User AstroFile",
		opts = {
			alpha = 0.75,
		},
	},

	{
		"jinh0/eyeliner.nvim",
		-- enabled = false,
		lazy = false,
		opts = {
			highlight_on_key = true,
			dim = true,
		},
	},

	{
		"TheSafdarAwan/find-extender.nvim",
		enabled = false,
		keys = { "f", "F", "F", "T", "t", "t", "T" },
		config = true,
	},

	{ "preservim/tagbar", cmd = "TagbarToggle", },
	{ "RishabhRD/nvim-cheat.sh", dependencies = { "RishabhRD/popfix", }, },

	{ "gennaro-tedesco/nvim-jqx" },

	{
		"cshuaimin/ssr.nvim",
		ft = "<leader>r",
		opts = {
			min_width = 50,
			min_height = 5,
			keymaps = {
				close = "q",
				next_match = "n",
				prev_match = "N",
				replace_all = "<leader><cr>",
			},
		},
	},

	{ "sindrets/diffview.nvim", event = "User AstroGitFile", },
	{
		"QuickGD/quickgd.nvim",
		-- dev = true,
		ft = "gdshader",
		cmd = {
			"GodotRun",
			"GodotRunLast",
			"GodotStart",
		},
		config = function()
	local quickgd = require("quickgd")
	quickgd.setup()
	quickgd.treesitter()
	quickgd.cmp()
		end,
	},

	{ "sbdchd/neoformat" },

	{ "eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton", config = true, },
}
