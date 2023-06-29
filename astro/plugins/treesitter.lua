return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    { 'andymass/vim-matchup',    init = function() vim.g.matchup_matchparen_deferred = 1 end },
    { 'HiPhish/nvim-ts-rainbow2' },
  },
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require('astronvim.utils').list_insert_unique(opts.ensure_installed, {
      'lua'
    })
    opts.auto_install = vim.fn.executable 'tree-sitter' == 1
    opts.highlight = { disable = { 'help' } }
    opts.matchup = { enable = true }
    opts.rainbow = { enable = true }
  end,
}
