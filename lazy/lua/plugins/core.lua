return {

  {
    'folke/trouble.nvim',
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    'nvim-telescope/telescope.nvim',
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
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        '<leader>fp',
        function() require('telescope.builtin').find_files({ cwd = require('lazy.core.config').options.root }) end,
        desc = 'Find Plugin File',
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = { prompt_position = 'top' },
        sorting_strategy = 'ascending',
        winblend = 0,
      },
    },
  },

  -- add telescope-fzf-native
  {
    'telescope.nvim',

  },

  -- add more treesitter parsers
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle', },
    },
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        'astro',
        'bash',
        'c_sharp',
        'c',
        'clojure',
        'cmake',
        'cpp',
        'cuda',
        'dart',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown_inline',
        'markdown',
        'objc',
        'proto',
        'python',
        'regex',
        'tsx',
        'typescript',
        'vim',
        'yaml',
      })
    end,
  },
}
