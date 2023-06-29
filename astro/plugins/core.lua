local get_icon = require('astronvim.utils').get_icon

return {
  { 'goolord/alpha-nvim',                  enabled = false },
  { 'max397574/better-escape.nvim',        enabled = false },
  { 'lukas-reineke/indent-blankline.nvim', enabled = false },

  {
    'mfussenegger/nvim-dap',
    dependencies = {
      { 'theHamsta/nvim-dap-virtual-text', config = true },
    }
  },
  {
    'akinsho/toggleterm.nvim',
    opts = {
      terminal_mappings = false,
    }
  },
  {
    'echasnovski/mini.ai',
    opts = {
      search_method = 'cover',
    }
  },
  {
    'rcarriga/nvim-notify',
    opts = {
      timeout = 0,
    }
  },
  {
    'mrjones2014/smart-splits.nvim',
    build = './kitty/install-kittens.bash',
    opts = function(_, opts) opts.at_edge = require('smart-splits.types').AtEdgeBehavior.stop end,
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signcolumn = false,
      numhl = true,
      current_line_blame_opts = { ignore_whitespace = true },
    },
  },

}
