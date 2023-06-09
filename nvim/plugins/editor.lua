local utils = require 'astronvim.utils'
return {
  {
    'goolord/alpha-nvim',
    enabled = false
  },
  {
    'NvChad/nvim-colorizer.lua',
    enabled = false
  },
  {
    'Pocco81/auto-save.nvim',
    event = { 'User AstroFile', 'InsertEnter' },
    opts = {},
  },
  {
    'max397574/better-escape.nvim',
    enabled = false
  },
  {
    'lambdalisue/suda.vim',
    keys = {
      {
        '<leader>W',
        ':SudaWrite<CR>',
        desc = 'Suda Write',
      },
    },
    cmd = {
      'SudaRead',
      'SudaWrite',
    },
  },
  {
    'gbprod/cutlass.nvim',
    event = { 'User AstroFile' },
    opts = function(_, opts)
      if utils.is_available 'leap.nvim' then opts.exclude = utils.list_insert_unique(opts.exclude, { 'ns', 'nS' }) end
      if utils.is_available 'hop.nvim' then opts.exclude = utils.list_insert_unique(opts.exclude, { 'ns', 'nS' }) end
    end,
  },
  {
    'echasnovski/mini.splitjoin',
    event = 'User AstroFile',
    opts = {},
  },
  {
    'folke/which-key.nvim',
    optional = true,
    opts = { plugins = { presets = { operators = false } } }
  },
  {
    'mvllow/modes.nvim',
    version = '^0.2',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'levouh/tint.nvim',
    event = 'User AstroFile',
    opts = {
      highlight_ignore_patterns = { 'WinSeparator', 'neo-tree', 'Status.*' },
      tint = -45,       -- Darken colors, use a positive value to brighten
      saturation = 0.6, -- Saturation to preserve
    },
  },
  {
    'azabiong/vim-highlighter',
    lazy = false, -- Not Lazy by default
    keys = {
      -- These are basing keymaps to guide new users
      { 'f<Enter>', desc = 'Highlight' },
      { 'f<BS>',    desc = 'Remove Highlight' },
      { 'f<C-L>',   desc = 'Clear Highlight' },
      { 'f<Tab>',   desc = 'Find Highlight (similar to Telescope grep)' },
      -- They are derivated from the default keymaps, see README.md to github repo for documentation
      { 'nn',       '<cmd>Hi><CR>',                                     desc = 'Next Recently Set Highlight' },
      { 'ng',       '<cmd>Hi<<CR>',                                     desc = 'Previous Recently Set Highlight' },
      { 'n[',       '<cmd>Hi{<CR>',                                     desc = 'Next Nearest Highlight' },
      { 'n]',       '<cmd>Hi}<CR>',                                     desc = 'Previous Nearest Highlight' },
    },
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    enabled = true,
    cmd = 'Oil',
    keys = {
      { '<leader>O', function() require('oil').open() end, desc = 'Open folder in Oil' },
    },
  },
  {
    'azabiong/vim-highlighter',
    lazy = false, -- Not Lazy by default
    keys = {
      -- These are basing keymaps to guide new users
      { 'f<Enter>', desc = 'Highlight' },
      { 'f<BS>',    desc = 'Remove Highlight' },
      { 'f<C-L>',   desc = 'Clear Highlight' },
      { 'f<Tab>',   desc = 'Find Highlight (similar to Telescope grep)' },
      -- They are derivated from the default keymaps, see README.md to github repo for documentation
      { 'nn',       '<cmd>Hi><CR>',                                     desc = 'Next Recently Set Highlight' },
      { 'ng',       '<cmd>Hi<<CR>',                                     desc = 'Previous Recently Set Highlight' },
      { 'n[',       '<cmd>Hi{<CR>',                                     desc = 'Next Nearest Highlight' },
      { 'n]',       '<cmd>Hi}<CR>',                                     desc = 'Previous Nearest Highlight' },
    },
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = { { 'theHamsta/nvim-dap-virtual-text', config = true }, }
  },
  {
    'akinsho/toggleterm.nvim',
    opts = { terminal_mappings = false, }
  },
  {
    'echasnovski/mini.ai',
    opts = { search_method = 'cover', }
  },
  {
    'rcarriga/nvim-notify',
  },
  {
    'mrjones2014/smart-splits.nvim',
  },
  {
    'Pocco81/true-zen.nvim',
    opts = function(_, opts)
      return utils.extend_tbl(opts, {
        integrations = {
          tmux = os.getenv 'TMUX' ~= nil,                -- hide tmux status bar in (minimalist, ataraxis)
          twilight = utils.is_available 'twilight.nvim', -- enable twilight (ataraxis)
        },
      })
    end,
    keys = {
      {
        '<leader>z',
        desc = 'True Zen',
      },
      {
        '<leader>z' .. 'f',
        function() require('true-zen').focus() end,
        desc = 'Focus (True Zen)',
      },
      {
        '<leader>z' .. 'm',
        function() require('true-zen').minimalist() end,
        desc = 'Minimalist (True Zen)',
      },
      {
        '<leader>z' .. 'a',
        function() require('true-zen').ataraxis() end,
        desc = 'Ataraxis (True Zen)',
      },
      {
        '<leader>z' .. 'n',
        function()
          local truezen = require 'true-zen'
          local first = 0
          local last = vim.api.nvim_buf_line_count(0)
          truezen.narrow(first, last)
        end,
        desc = 'Narrow (True Zen)',
      },
      {
        '<leader>z' .. 'n',
        function()
          local truezen = require 'true-zen'
          local first = vim.fn.line 'v'
          local last = vim.fn.line '.'
          truezen.narrow(first, last)
        end,
        desc = 'Narrow (True Zen)',
        mode = { 'v' },
      },
    },
  },
  {
    'echasnovski/mini.move',
    keys = {
      { '<M-l>', mode = { 'n', 'v' } },
      { '<M-k>', mode = { 'n', 'v' } },
      { '<M-j>', mode = { 'n', 'v' } },
      { '<M-h>', mode = { 'n', 'v' } },
    },
    opts = {},
  },
  {
    'arsham/indent-tools.nvim',
    dependencies = { 'arsham/arshlib.nvim' },
    event = 'User AstroFile',
    config = function() require('indent-tools').config {} end,
  },
  {
    'danymat/neogen',
    cmd = 'Neogen',
    opts = {
      snippet_engine = 'luasnip',
      languages = {
        lua = { template = { annotation_convention = 'emmylua' } },
        typescript = { template = { annotation_convention = 'tsdoc' } },
        typescriptreact = { template = { annotation_convention = 'tsdoc' } },
      },
    },
    keys = {
      { '<leader>a',           desc = 'Annotation' },
      { '<leader>a' .. '<cr>', function() require('neogen').generate { type = 'current' } end, desc = 'Current' },
      { '<leader>a' .. 'c',    function() require('neogen').generate { type = 'class' } end,   desc = 'Class' },
      { '<leader>a' .. 'f',    function() require('neogen').generate { type = 'func' } end,    desc = 'Function' },
      { '<leader>a' .. 't',    function() require('neogen').generate { type = 'type' } end,    desc = 'Type' },
      { '<leader>a' .. 'F',    function() require('neogen').generate { type = 'file' } end,    desc = 'File' },
    },
  },
  {
    'uga-rosa/ccc.nvim',
    event = 'User AstroFile',
    keys = { { '<leader>uC', '<cmd>CccPick<cr>', desc = 'Toggle colorizer' } },
    opts = { highlighter = { auto_enable = true } },
  },
  {
    'folke/todo-comments.nvim',
    event = 'User AstroFile',
    cmd = { 'TodoTrouble', 'TodoTelescope', 'TodoLocList', 'TodoQuickFix' },
    opts = {},
  },
  {
    'johmsalas/text-case.nvim',
    event = 'User AstroFile',
    opts = {},
  },
  {
    'karb94/neoscroll.nvim',
    event = 'BufRead',
    config = function()
      require('neoscroll').setup {
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
        performance_mode = false,    -- Disable 'Performance Mode' on all buffers.
      }
    end,
  },
  {
    'junegunn/vim-easy-align',
    event = 'User AstroFile'
  },
  {
    'machakann/vim-sandwich',
    cmd = 'SandwichHighlightToggle',
    keys = {
      { 'sa', desc = 'Add surrounding',    mode = { 'n', 'v' } },
      { 'sd', desc = 'Delete surrounding' },
      { 'sr', desc = 'Replace surrounding' },
    },
    config = function()
      local function set_hl(enabled) vim.fn['operator#sandwich#set']('all', 'all', 'highlight', enabled and 3 or 0) end
      vim.api.nvim_create_user_command('SandwichHighlightToggle', function()
        vim.g.sandwich_highlighting = not vim.g.sandwich_highlighting
        set_hl(vim.g.sandwich_highlighting)
        require('astronvim.utils').notify(
          ('Surround highlights %s'):format(vim.g.sandwich_highlighting and 'on' or 'off')
        )
      end, { desc = 'Toggle highlighting for vim-sandwich' })
      set_hl(false)
    end,
  },
  {
    'wakatime/vim-wakatime',
    event = 'User AstroFile'
  },
  {
    'm4xshen/smartcolumn.nvim',
    event = { 'InsertEnter', 'User AstroFile' },
    opts = { colorcolumn = '120', },
  },
  {
    'wsdjeg/vim-fetch',
    lazy = false,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'User AstroFile',
    opts = {
      char = '│',
      filetype_exclude = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy' },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },
  {
    'echasnovski/mini.indentscope',
    event = 'User AstroFile',
    opts = { symbol = '│', options = { try_as_border = true } },
    config = function(_, opts)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'fzf', 'starter', 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason' },
        callback = function() vim.b.miniindentscope_disable = true end,
      })
      require('mini.indentscope').setup(opts)
    end,
  },
  {
    'arsham/indent-tools.nvim',
    dependencies = { 'arsham/arshlib.nvim' },
    event = 'User AstroFile',
    config = function() require('indent-tools').config {} end,
  },

  { 'nyoom-engineering/oxocarbon.nvim', },
  { 'kvrohit/mellow.nvim', },
  {
    'gen740/SmoothCursor.nvim',
    cond = vim.g.neovide == nil,
    lazy = false,
    opts = {
      autostart = true,
      fancy = { enable = true },
    },
  },
  {
    'zbirenbaum/neodim',
    event = 'LspAttach',
    opts = {
      alpha = 0.75,
      blend_color = '#000000',
      update_in_insert = {
        enable = true,
        delay = 100,
      },
      hide = {
        virtual_text = true,
        signs = true,
        underline = true,
      },
    },
  },
  {
    'andweeb/presence.nvim',
    event = 'VeryLazy',
    opts = { client_id = '1009122352916857003' }
  },

  {
    'm-demare/hlargs.nvim',
    opts = {},
    event = 'User AstroFile'
  },
  {
    'romainl/vim-cool',
    event = 'User AstroFile',
  },
  {
    'junegunn/vim-easy-align',
    event = 'User AstroFile'
  },
  {
    'willothy/flatten.nvim',
    opts = {},
    lazy = false,
    priority = 1001
  },
  {
    'jabirali/vim-tmux-yank',
    event = 'User AstroFile',
  },
  {
    'vimpostor/vim-tpipeline',
    lazy = false,
  },
  {
    'petertriho/nvim-scrollbar',
    opts = {
      handlers = {
        gitsigns = require('astronvim.utils').is_available 'gitsigns',
        search = require('astronvim.utils').is_available 'hlslens',
        ale = require('astronvim.utils').is_available 'ale',
      },
    },
    event = 'User AstroFile',
  },
}
