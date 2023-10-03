return {
  {
    'telescope.nvim',
    dependencies = {
      "nvim-notify",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      'nvim-telescope/telescope-bibtex.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-hop.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
      "AckslD/nvim-neoclip.lua",
      "benfowler/telescope-luasnip.nvim",
      "jvgrootveld/telescope-zoxide",
      "nvim-telescope/telescope-ghq.nvim",
      "nvim-telescope/telescope-github.nvim",
      "olacin/telescope-cc.nvim",
      "ThePrimeagen/refactoring.nvim",
      "tsakirist/telescope-lazy.nvim",
      build = 'make',
      config = function()
        local telescope = require 'telescope'
        telescope.load_extension 'fzy'
        telescope.load_extension 'fzy_native'
        telescope.load_extension 'live_grep_args'
        telescope.load_extension 'bibtex'
        telescope.load_extension 'file_browser'
        telescope.load_extension 'projects'
        telescope.load_extension 'ghq'
        telescope.load_extension 'gh'
        telescope.load_extension 'neoclip'
        telescope.load_extension 'luasnip'
        telescope.load_extension 'zoxide'
        telescope.load_extension 'lazy'
        telescope.load_extension 'conventional_commits'
        telescope.load_extension 'refactoring'
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
