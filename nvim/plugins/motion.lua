local prefix = '<leader><leader>'
local term_string = vim.fn.exists '$TMUX' == 1 and 'tmux' or 'terminal'
return {
  {
    'cbochs/grapple.nvim',
    -- branch = 'dev',
    lazy = false,
    config = function()
      require('grapple').setup {
        setup = require('grapple.scope').fallback {
          require('grapple').resolvers.lsp_fallback,
          require('grapple').resolvers.git_fallback,
          require('grapple').resolvers.static,
        },
      }
      require('astronvim.utils').set_mappings {
        n = {
          ['gt'] = { ':GrappleToggle<cr>', desc = 'Tags current buffer' },
          ['gp'] = { ':GrapplePopup tags<cr>', desc = 'Grapple tag popup menu' },
        },
      }
    end,
    keys = {
      { prefix,        desc = 'Grapple' },
      { prefix .. 'a', '<cmd>GrappleTag<CR>',            desc = 'Add file' },
      { prefix .. 'd', '<cmd>GrappleUntag<CR>',          desc = 'Remove file' },
      { prefix .. 't', '<cmd>GrappleToggle<CR>',         desc = 'Toggle a file' },
      { prefix .. 'e', '<cmd>GrapplePopup tags<CR>',     desc = 'Select from tags' },
      { prefix .. 's', '<cmd>GrapplePopup scopes<CR>',   desc = 'Select a project scope' },
      { prefix .. 'x', '<cmd>GrappleReset<CR>',          desc = 'Clear tags from current project' },
      { '<C-n>',       '<cmd>GrappleCycle forward<CR>',  desc = 'Select next tag' },
      { '<C-p>',       '<cmd>GrappleCycle backward<CR>', desc = 'Select previous tag' },
    },
  },
  {
    'ggandor/flit.nvim',
    keys = function()
      ---@type LazyKeys[]
      local ret = {}
      for _, key in ipairs { 'f', 'F', 't', 'T' } do
        ret[#ret + 1] = { key, mode = { 'n', 'x', 'o' }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = 'nx' },
    dependencies = {
      'ggandor/leap.nvim',
      dependencies = {
        'tpope/vim-repeat',
      },
    },
  },
  {
    'ThePrimeagen/harpoon',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    cmd = { 'Harpoon' },
    keys = {
      {
        prefix,
        function() end,
        desc = (vim.g.icons_enabled and '󱡀 ' or '') ..
            'Harpoon'
      },
      { prefix .. 'a', function() require('harpoon.mark').add_file() end,        desc = 'Add file' },
      { prefix .. 'e', function() require('harpoon.ui').toggle_quick_menu() end, desc = 'Toggle quick menu' },
      {
        '<C-x>',
        function()
          vim.ui.input({ prompt = 'Harpoon mark index: ' }, function(input)
            local num = tonumber(input)
            if num then require('harpoon.ui').nav_file(num) end
          end)
        end,
        desc = 'Goto index of mark',
      },
      { '<C-p>',       function() require('harpoon.ui').nav_prev() end, desc = 'Goto previous mark' },
      { '<C-n>',       function() require('harpoon.ui').nav_next() end, desc = 'Goto next mark' },
      { prefix .. 'm', '<cmd>Telescope harpoon marks<CR>',              desc = 'Show marks in Telescope' },
      {
        prefix .. 't',
        function()
          vim.ui.input({ prompt = term_string .. ' window number: ' }, function(input)
            local num = tonumber(input)
            if num then require('harpoon.' .. term_string).gotoTerminal(num) end
          end)
        end,
        desc = 'Go to ' .. term_string .. ' window',
      },
    },
  },
  {
    'phaazon/hop.nvim',
    opts = {},
    keys = {
      {
        's',
        function() require('hop').hint_words() end,
        mode = { 'n' },
        desc = 'Hop hint words',
      },
      {
        '<S-s>',
        function() require('hop').hint_lines() end,
        mode = { 'n' },
        desc = 'Hop hint lines',
      },
      {
        's',
        function() require('hop').hint_words { extend_visual = true } end,
        mode = { 'v' },
        desc = 'Hop hint words',
      },
      {
        '<S-s>',
        function() require('hop').hint_lines { extend_visual = true } end,
        mode = { 'v' },
        desc = 'Hop hint lines',
      },
    },
  },
  {
    'ggandor/leap.nvim',
    keys = {
      { 's',  '<Plug>(leap-forward-to)',    mode = { 'n', 'x', 'o' }, desc = 'Leap forward to' },
      { 'S',  '<Plug>(leap-backward-to)',   mode = { 'n', 'x', 'o' }, desc = 'Leap backward to' },
      { 'x',  '<Plug>(leap-forward-till)',  mode = { 'x', 'o' },      desc = 'Leap forward till' },
      { 'X',  '<Plug>(leap-backward-till)', mode = { 'x', 'o' },      desc = 'Leap backward till' },
      { 'gs', '<Plug>(leap-from-window)',   mode = { 'n', 'x', 'o' }, desc = 'Leap from window' },
    },
    opts = {},
    dependencies = {
      'tpope/vim-repeat',
    },
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
  {
    'chrisgrieser/nvim-spider',
    keys = {
      { 'w',  '<cmd>lua require(\'spider\').motion(\'w\')<CR>',  mode = { 'n', 'x', 'o' } },
      { 'e',  '<cmd>lua require(\'spider\').motion(\'e\')<CR>',  mode = { 'n', 'x', 'o' } },
      { 'b',  '<cmd>lua require(\'spider\').motion(\'b\')<CR>',  mode = { 'n', 'x', 'o' } },
      { 'ge', '<cmd>lua require(\'spider\').motion(\'ge\')<CR>', mode = { 'n', 'x', 'o' } },
    },
    opts = {},
  },
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    opts = {},
  },
  {
    'cbochs/portal.nvim',
    opts = {},
    keys = {
      { '<leader>o', '<cmd>Portal jumplist backward<cr>', desc = 'Portal Jump backward' },
      { '<leader>i', '<cmd>Portal jumplist forward<cr>',  desc = 'Portal Jump forward' },
    },
  },

}
