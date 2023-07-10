return {
  -- Configure AstroNvim updates
  updater = {
    remote = 'origin',     -- remote to use
    channel = 'nightly',   -- 'stable' or 'nightly'
    version = 'latest',    -- 'latest', tag name, or regex search like 'v1.*' to only do updates before v2 (STABLE ONLY)
    branch = 'nightly',    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ['remote_name'] = 'https://remote_url.come/repo.git', -- full remote url
      --   ['remote2'] = 'github_user/repo', -- GitHub user/repo shortcut,
      --   ['remote3'] = 'github_user', -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = 'nordfox',

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = false, -- disable virtual text
    signs = { active = signs },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focused = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  },
  -- Configure require('lazy').setup() options
  lazy = {
    diff = { cmd = "terminal_git" },
    checker = { enabled = true },
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { 'tohtml', 'gzip', 'matchit', 'zipPlugin', 'netrwPlugin', 'tarPlugin' },
      },
    },
  },
}
