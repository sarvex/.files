local prefix = 'gz'

return {
  {
    'echasnovski/mini.animate',
    event = 'VeryLazy',
    cond = not vim.g.neovide,
    -- enabled = false,
    opts = function()
      -- don't use animate when scrolling with the mouse
      local mouse_scrolled = false
      for _, scroll in ipairs { 'Up', 'Down' } do
        local key = '<ScrollWheel' .. scroll .. '>'
        vim.keymap.set({ '', 'i' }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require 'mini.animate'
      return {
        resize = {
          timing = animate.gen_timing.linear { duration = 100, unit = 'total' },
        },
        scroll = {
          timing = animate.gen_timing.linear { duration = 150, unit = 'total' },
          subscroll = animate.gen_subscroll.equal {
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          },
        },
        cursor = {
          timing = animate.gen_timing.linear { duration = 80, unit = 'total' },
        },
      }
    end,
  },
  {
    'echasnovski/mini.ai',
    event = 'User AstroFile',
    opts = {},
  },
  {
    'echasnovski/mini.basics',
    version = false,
    event = 'User AstroFile',
    opts = {
      mappings = {
        windows = true,
        move_with_alt = true,
      },
    },
  },
  {
    'echasnovski/mini.bracketed',
    event = 'User AstroFile',
    opts = {},
  },
  {
    'echasnovski/mini.move',
    keys = {
      { '<A-h>', mode = 'n', desc = 'Move line left' },
      { '<A-j>', mode = 'n', desc = 'Move line down' },
      { '<A-k>', mode = 'n', desc = 'Move line up' },
      { '<A-l>', mode = 'n', desc = 'Move line right' },
      { '<A-h>', mode = 'v', desc = 'Move selection left' },
      { '<A-j>', mode = 'v', desc = 'Move selection down' },
      { '<A-k>', mode = 'v', desc = 'Move selection up' },
      { '<A-l>', mode = 'v', desc = 'Move selection right' },
    },
    opts = {
      mappings = {
        left = '<A-h>',
        right = '<A-l>',
        down = '<A-j>',
        up = '<A-k>',
        line_left = '<A-h>',
        line_right = '<A-l>',
        line_down = '<A-j>',
        line_up = '<A-k>',
      },
    },
  },
  { 'machakann/vim-sandwich', enabled = false },
  {
    'echasnovski/mini.surround',
    keys = {
      { prefix, desc = 'Surround' },
    },
    opts = {
      mappings = {
        add = prefix .. 'a',            -- Add surrounding in Normal and Visual modes
        delete = prefix .. 'd',         -- Delete surrounding
        find = prefix .. 'f',           -- Find surrounding (to the right)
        find_left = prefix .. 'F',      -- Find surrounding (to the left)
        highlight = prefix .. 'h',      -- Highlight surrounding
        replace = prefix .. 'r',        -- Replace surrounding
        update_n_lines = prefix .. 'n', -- Update `n_lines`
      },
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
    'echasnovski/mini.splitjoin',
    event = 'User AstroFile',
    opts = {},
  },
  { 'numToStr/Comment.nvim',  enabled = false },
  {
    'echasnovski/mini.comment',
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    event = 'User AstroFile',
    opts = {
      hooks = {
        pre = function() require('ts_context_commentstring.internal').update_commentstring {} end,
      },
    },
  },
}
