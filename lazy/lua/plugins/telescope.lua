return {
  {
    'telescope.nvim',
    dependencies = {
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
      'nvim-telescope/telescope-hop.nvim',
      'nvim-telescope/telescope-bibtex.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      build = 'make',
      config = function()
        local telescope = require 'telescope'
        telescope.load_extension 'fzy'
        telescope.load_extension 'fzy_native'
        telescope.load_extension 'live_grep_args'
        telescope.load_extension 'bibtex'
        telescope.load_extension 'file_browser'
        telescope.load_extension 'projects'
      end,
    },
    keys = {
      {
        '<leader>fP',
        function()
          require('telescope.builtin').find_files({
            cwd = require('lazy.core.config').options.root,
          })
        end,
        desc = 'Find Plugin File',
      },
    },
    opts = {
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = { prompt_position = 'top' },
        sorting_strategy = 'ascending',
        winblend = 0,
      },
    },
  },
}
