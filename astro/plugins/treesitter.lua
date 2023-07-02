return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    {
      'andymass/vim-matchup',
      init = function() vim.g.matchup_matchparen_deferred = 1 end
    },
    {
      'matze/vim-move',
      event = 'BufEnter',
    },
    {
      'HiPhish/nvim-ts-rainbow2',
      config = function()
        require('nvim-treesitter.configs').setup {
          rainbow = {
            enable = true,
            query = 'rainbow-parens',
            strategy = require 'ts-rainbow.strategy.global',
          },
        }
      end,
    },
    {
      'Wansmer/treesj',
      keys = { { '<leader>m', '<CMD>TSJToggle<CR>', desc = 'Toggle Treesitter Join' } },
      cmd = { 'TSJToggle', 'TSJSplit', 'TSJJoin' },
      opts = { use_default_keymaps = false },
    },
    {
      'Wansmer/sibling-swap.nvim',
      keys = { 'sl', 'sh' },
      opts = {
        keymaps = {
          ['sl'] = 'swap_with_right',
          ['sh'] = 'swap_with_left',
          -- ['sL'] = 'swap_with_right_with_opp',
          -- ['sH'] = 'swap_with_left_with_opp',
        },
      },
    },
    {
      'nvim-treesitter/playground',
      cmd = 'TSPlaygroundToggle',
    },
  },
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require('astronvim.utils').list_insert_unique(opts.ensure_installed, {
      'c',
      'lua',
      'vim',
      'rust',
      'cpp',
      'gdscript',
      'regex',
      'python',
    })
    opts.auto_install = vim.fn.executable 'tree-sitter' == 1
    opts.highlight = { disable = { 'help' } }
    opts.matchup = { enable = true }
    opts.rainbow = { enable = true }
  end,
}
