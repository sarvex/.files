local prefix = '<leader>s'
return {
  {
    'folke/twilight.nvim',
    keys = { { '<leader>uT', '<cmd>Twilight<cr>', desc = 'Toggle Twilight' } },
    cmd = {
      'Twilight',
      'TwilightEnable',
      'TwilightDisable',
    },
  },
  {
    'bennypowers/nvim-regexplainer',
    opts = {},
    ft = { 'html', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  },
  {
    'monaqa/dial.nvim',
    keys = {
      {
        '<C-a>',
        mode = { 'v' },
        function() return require('dial.map').inc_visual() end,
        expr = true,
        desc = 'Increment',
      },
      {
        '<C-x>',
        mode = { 'v' },
        function() return require('dial.map').dec_visual() end,
        expr = true,
        desc = 'Decrement',
      },
      {
        'g<C-a>',
        mode = { 'v' },
        function() return require('dial.map').inc_gvisual() end,
        expr = true,
        desc = 'Increment',
      },
      {
        'g<C-x>',
        mode = { 'v' },
        function() return require('dial.map').dec_gvisual() end,
        expr = true,
        desc = 'Decrement',
      },
      {
        '<C-a>',
        function() return require('dial.map').inc_normal() end,
        expr = true,
        desc = 'Increment',
      },
      {
        '<C-x>',
        function() return require('dial.map').dec_normal() end,
        expr = true,
        desc = 'Decrement',
      },
    },
    config = function()
      local augend = require 'dial.augend'
      require('dial.config').augends:register_group {
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias['%Y/%m/%d'],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.case.new {
            types = { 'camelCase', 'PascalCase', 'snake_case', 'SCREAMING_SNAKE_CASE' },
          },
        },
      }
    end,
  },

  {
    'Zeioth/compiler.nvim',
    dependencies = {
      {
        'stevearc/overseer.nvim',
        opts = {
          task_list = { -- this refers to the window that shows the result
            direction = 'bottom',
            min_height = 25,
            max_height = 25,
            default_detail = 1,
            bindings = {
              ['q'] = function() vim.cmd 'OverseerClose' end,
            },
          },
        },
        config = function(_, opts) require('overseer').setup(opts) end,
      },
    },
    cmd = { 'CompilerOpen', 'CompilerToggleResults' },
    opts = {},
  },
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    opts = {}
  },
  {
    'Weissle/persistent-breakpoints.nvim',
    event = 'BufReadPost',
    opts = function(_, opts)
      return require('astronvim.utils').extend_tbl(opts, {
        load_breakpoints_event = { 'BufReadPost' },
      })
    end,
    keys = {
      {
        '<leader>db',
        function() require('persistent-breakpoints.api').toggle_breakpoint() end,
        { silent = true },
        desc = 'Toggle Breakpoint',
      },
      {
        '<leader>dB',
        function() require('persistent-breakpoints.api').clear_all_breakpoints() end,
        { silent = true },
        desc = 'Clear Breakpoints',
      },
      {
        '<leader>dC',
        function() require('persistent-breakpoints.api').set_conditional_breakpoint() end,
        { silent = true },
        desc = 'Conditional Breakpoint',
      },
    },
  },
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    event = 'LspAttach',
    opts = {}
  },
  {
    'nvim-pack/nvim-spectre',
    cmd = 'Spectre',
    keys = {
      { prefix,        desc = 'Search / Replace',                  mode = { 'n', 'x' } },
      { prefix .. 's', function() require('spectre').toggle() end, desc = 'Toggle Spectre' },
      {
        prefix .. 'w',
        mode = 'x',
        function() require('spectre').open_visual { select_word = true } end,
        desc = 'Spectre (current word)',
      },
      { prefix .. 'f', function() require('spectre').open_file_search() end, desc = 'Spectre (current file)' },
    },
    opts = function()
      local prefix = '<leader>s'
      return {
        mapping = {
          send_to_qf = { map = prefix .. 'q' },
          replace_cmd = { map = prefix .. 'c' },
          show_option_menu = { map = prefix .. 'o' },
          run_current_replace = { map = prefix .. 'C' },
          run_replace = { map = prefix .. 'R' },
          change_view_mode = { map = prefix .. 'v' },
          resume_last_search = { map = prefix .. 'l' },
        },
      }
    end,
  },
  {
    'ahmedkhalf/project.nvim',
    event = 'VeryLazy',
    opts = {
      ignore_lsp = { 'lua_ls', 'julials' },
    },
    config = function(_, opts) require('project_nvim').setup(opts) end,
  },
}
