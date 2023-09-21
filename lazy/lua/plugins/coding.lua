return {
  {
    'huggingface/hfcc.nvim',
    opts = {
      api_token = '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',
      model = 'bigcode/starcoder',
      query_params = {
        max_new_tokens = 200,
      },
    },
    init = function()
      vim.api.nvim_create_user_command('StarCoder', function()
        require('hfcc.completion').complete()
      end, {})
    end,
  },

  {
    'danymat/neogen',
    keys = {
      {
        '<leader>cc',
        function()
          require('neogen').generate({})
        end,
        desc = 'Neogen Comment',
      },
    },
    opts = { snippet_engine = 'luasnip' },
  },

  {
    'smjonas/inc-rename.nvim',
    cmd = 'IncRename',
    config = true,
  },

  {
    'ThePrimeagen/refactoring.nvim',
    keys = {
      {
        '<leader>r',
        function()
          require('refactoring').select_refactor()
        end,
        mode = 'v',
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {},
  },

  {
    'echasnovski/mini.bracketed',
    event = 'BufReadPost',
    config = function()
      local bracketed = require('mini.bracketed')

      -- local function put(cmd, regtype)
      --   local body = vim.fn.getreg(vim.v.register)
      --   local type = vim.fn.getregtype(vim.v.register)
      --   ---@diagnostic disable-next-line: param-type-mismatch
      --   vim.fn.setreg(vim.v.register, body, regtype or 'l')
      --   bracketed.register_put_region()
      --   vim.cmd(('normal! '%s%s'):format(vim.v.register, cmd:lower()))
      --   ---@diagnostic disable-next-line: param-type-mismatch
      --   vim.fn.setreg(vim.v.register, body, type)
      -- end
      --
      -- for _, cmd in ipairs({ ']p', '[p' }) do
      --   vim.keymap.set('n', cmd, function()
      --     put(cmd)
      --   end)
      -- end
      -- for _, cmd in ipairs({ ']P', '[P' }) do
      --   vim.keymap.set('n', cmd, function()
      --     put(cmd, 'c')
      --   end)
      -- end
      --
      -- local put_keys = { 'p', 'P' }
      -- for _, lhs in ipairs(put_keys) do
      --   vim.keymap.set({ 'n', 'x' }, lhs, function()
      --     return bracketed.register_put_region(lhs)
      --   end, { expr = true })
      -- end

      bracketed.setup({
        file = { suffix = '' },
        window = { suffix = '' },
        quickfix = { suffix = '' },
        yank = { suffix = '' },
        treesitter = { suffix = 'n' },
      })
    end,
  },

  -- better increase/descrease
  {
    'monaqa/dial.nvim',
    -- stylua: ignore
    keys = {
      { '<C-a>', function() return require('dial.map').inc_normal() end, expr = true, desc = 'Increment' },
      { '<C-x>', function() return require('dial.map').dec_normal() end, expr = true, desc = 'Decrement' },
    },
    config = function()
      local augend = require('dial.augend')
      require('dial.config').augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias['%Y/%m/%d'],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.constant.new({ elements = { 'let', 'const' } }),
        },
      })
    end,
  },

  -- add symbols-outline
  {
    'simrat39/symbols-outline.nvim',
    keys = { { '<leader>cs', '<cmd>SymbolsOutline<cr>', desc = 'Symbols Outline' } },
    cmd = 'SymbolsOutline',
    opts = {},
  },

  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  }
}
