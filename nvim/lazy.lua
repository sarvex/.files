-- Configure require('lazy').setup() options
return {
  diff = { cmd = "terminal_git" },
  checker = { enabled = true },
  defaults = { lazy = true },
  performance = {
    rtp = {
      -- customize default disabled vim plugins
      disabled_plugins = { 'tohtml', 'gzip', 'matchit', 'zipPlugin', 'netrwPlugin', 'tarPlugin' },
    },
  },
}
