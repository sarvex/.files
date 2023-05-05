return {
	"shaunsingh/nord.nvim",
	opts = function(_, opts)
		markdown = {
			headline_highlights = {
				"Headline1",
				"Headline2",
				"Headline3",
				"Headline4",
				"Headline5",
				"Headline6",
			},
			codeblock_highlight = "CodeBlock",
			dash_highlight = "Dash",
			quote_highlight = "Quote",
		}
		return opts
	end,
	init = function()
		vim.g.nord_contrast = true
		vim.g.nord_borders = false
		vim.g.nord_disable_background = false
		vim.g.nord_italic = false
		vim.g.nord_uniform_diff_background = true
		vim.g.nord_bold = false
	end,
	config = function()
		require("nord").set()
	end,
}
