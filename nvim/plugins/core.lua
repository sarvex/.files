local get_icon = require('astronvim.utils').get_icon

return {
  { 'goolord/alpha-nvim', enabled = false },

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
}
