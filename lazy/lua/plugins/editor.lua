return {
  {
    "echasnovski/mini.align",
    opts = {},
    keys = {
      { "ga", mode = { "n", "v" } },
      { "gA", mode = { "n", "v" } },
    },
  },

  {
    "echasnovski/mini.bracketed",
    event = "BufReadPost",
    enabled = false,
    config = function()
      local bracketed = require("mini.bracketed")
      bracketed.setup({
        file = { suffix = "" },
        window = { suffix = "" },
        quickfix = { suffix = "" },
        yank = { suffix = "" },
        treesitter = { suffix = "n" },
      })
    end,
  },

  {
    "echasnovski/mini.splitjoin",
    enabled = false,
    opts = { mappings = { toggle = "J" } },
    keys = {
      { "J", desc = "Split/Join" },
    },
  },

  {
    "2kabhishek/nerdy.nvim",
    cmd = "Nerdy",
    keys = {
      { "<leader>ci", "<cmd>Nerdy<cr>", desc = "Pick Icon" },
    },
  },

  {
    "echasnovski/mini.pick",
    cmd = "Pick",
    opts = {},
  },

  {
    "AckslD/muren.nvim",
    event = {
      { "BufNewFile", "BufAdd" },
    },
    opts = {
      patterns_width = 60,
      patterns_height = 20,
      options_width = 40,
      preview_height = 24,
    },
    cmd = "MurenToggle",
  },

  { "pwntester/octo.nvim", opts = {}, cmd = "Octo" },

  -- floating winbar
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    enabled = false,
    config = function()
      local colors = require("tokyonight.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = "#FC56B1", guifg = colors.black },
            InclineNormalNC = { guifg = "#FC56B1", guibg = colors.black },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  -- auto-resize windows
  {
    "anuvyklack/windows.nvim",
    event = "WinNew",
    dependencies = {
      { "anuvyklack/middleclass" },
      { "anuvyklack/animation.nvim", enabled = false },
    },
    keys = { { "<leader>m", "<cmd>WindowsMaximize<cr>", desc = "Zoom" } },
    config = function()
      vim.o.winwidth = 5
      vim.o.equalalways = false
      require("windows").setup({
        animation = { enable = false, duration = 150 },
      })
    end,
  },

  { -- buffer enhancements
    {
      "lewis6991/satellite.nvim",
      dependencies = {
        "lewis6991/gitsigns.nvim",
      },
      event = "VeryLazy",
      opts = {
        excluded_filetypes = { "alpha", "dashboard", "neo-tree", "noice", "prompt", "TelescopePrompt" },
      },
    },
  },

  "folke/twilight.nvim",

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  -- neorg
  {
    'nvim-neorg/neorg',
    enabled = false,
    ft = 'norg',
    opts = {
      load = {
        ['core.defaults'] = {},
        ['core.norg.concealer'] = {},
        ['core.norg.completion'] = {
          config = { engine = 'nvim-cmp' },
        },
        ['core.integrations.nvim-cmp'] = {},
      },
    },
  },
}
