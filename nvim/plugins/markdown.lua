local utils = require 'astronvim.utils'

--  [markdown markmap]
--  https://github.com/Zeioth/markmap.nvim
return
{
  {
    'Zeioth/markmap.nvim',
    cmd = { 'MarkmapOpen', 'MarkmapSave', 'MarkmapWatch', 'MarkmapWatchStop' },
    opts = {
      hide_toolbar = 'false',
    },
  },
  {
    'lukas-reineke/headlines.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    ft = 'markdown',
    opts = {},
  },
  {
    'ellisonleao/glow.nvim',
    cmd = 'Glow',
    opts = {}
  },
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    ft = 'markdown',
  },
  {
    'toppair/peek.nvim',
    build = 'deno task --quiet build:fast',
    config = function()
      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
    cmd = {
      'PeekOpen',
      'PeekClose',
    },
  },
  {
    'lervag/vimtex',
    lazy = false
  },
  {
    'lukas-reineke/headlines.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    ft = { 'markdown', 'norg', 'org', 'rmd' },
    opts = {},
  }
}
