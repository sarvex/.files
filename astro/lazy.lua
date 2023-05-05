local data = vim.fn.stdpath("data")

return {
	dev = {
		path = data .. "/dev",
		patterns = {},
	},
	defaults = { lazy = true },
	performance = {
		rtp = {
			-- customize default disabled vim plugins
			disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
		},
	},
}
