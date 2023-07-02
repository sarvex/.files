return {
  'rose-pine/neovim',
  name = 'rose-pine',
  -- lazy = false,
  priority = 1000,
  opts = {
    dark_variant = 'moon',
    disable_italics = 'true',
    disable_float_background = 'true',
    highlight_groups = {
      TSRainbowRed = { fg = 'love' },
      TSRainbowBlue = { fg = 'foam' },
      TSRainbowCyan = { fg = 'rose' },
      TSRainbowGreen = { fg = 'pine' },
      TSRainbowOrange = { fg = '#CAE7A7' },
      TSRainbowViolet = { fg = 'iris' },
      TSRainbowYellow = { fg = 'gold' },

      StatusNormal = { fg = 'surface', bg = 'rose' },
      StatusInsert = { fg = 'surface', bg = 'foam' },
      StatusVisual = { fg = 'surface', bg = 'iris' },
      StatusReplace = { fg = 'surface', bg = 'love' },
      StatusCommand = { fg = 'surface', bg = 'gold' },
    },
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    opts = {
      term_colors = true,
      transparent_background = true,
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      dim_inactive = { enabled = true, percentage = 0.25 },
      integrations = {
        alpha = true,
        dashboard = false,
        nvimtree = false,
        ts_rainbow = false,
        barbecue = false,
        navic = false,
        dropbar = false,

        aerial = true,
        dap = { enabled = true, enable_ui = true },
        headlines = true,
        mason = true,
        native_lsp = { enabled = true, inlay_hints = { background = false } },
        neotree = true,
        noice = true,
        notify = true,
        sandwich = true,
        semantic_tokens = true,
        symbols_outline = true,
        telescope = { enabled = true },
        which_key = true,

        mini = true,
        leap = true,
        markdown = true,
        neotest = true,
        cmp = true,
        overseer = true,
        lsp_trouble = true,
        ts_rainbow2 = true,
        treesitter = true,
        gitsigns = true,
      },
      custom_highlights = {
        -- disable italics  for treesitter highlights
        TabLineFill = { link = 'StatusLine' },
        LspInlayHint = { style = { 'italic' } },
        ['@parameter'] = { style = {} },
        ['@type.builtin'] = { style = {} },
        ['@namespace'] = { style = {} },
        ['@text.uri'] = { style = { 'underline' } },
        ['@tag.attribute'] = { style = {} },
        ['@tag.attribute.tsx'] = { style = {} },
      },
    },
  },
  {
    'folke/tokyonight.nvim',
    -- lazy = false,
    priority = 1000,
    opts = {
      style = 'moon',                     -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
      transparent = vim.g.neovide == nil, -- Enable this to disable setting the background color
      terminal_colors = true,             -- Configure the colors used when opening a `:terminal` in Neovim                                                                                                  |
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value `:help attr-list`
        comments = 'italic',
        keywords = 'NONE',
        functions = 'NONE',
        variables = 'NONE',
        -- Background styles. Can be 'dark', 'transparent' or 'normal'
        sidebars = 'transparent',                                                  -- style for sidebars, see below
        floats = 'transparent',                                                    -- style for floating windows
      },
      sidebars = { 'qf', 'help', 'vista_kind', 'terminal', 'packer', 'neo-tree' }, -- Set a darker background on sidebar-like windows. For example: `['qf', 'vista_kind', 'terminal', 'packer']`                                                      |
      day_brightness = 0.3,                                                        -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors                                                  |
      hide_inactive_statusline = false,                                            -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**. |
      dim_inactive = false,                                                        -- dims inactive windows
      lualine_bold = false,                                                        -- When `true`, section headers in the lualine theme will be bold|
      on_highlights = function(hl, _)
        hl.TSRainbowRed = { link = 'rainbowcol1' }
        hl.TSRainbowOrange = { link = 'rainbowcol2' }
        hl.TSRainbowGreen = { link = 'rainbowcol3' }
        hl.TSRainbowCyan = { link = 'rainbowcol4' }
        hl.TSRainbowBlue = { link = 'rainbowcol5' }
        hl.TSRainbowViolet = { link = 'rainbowcol6' }
        hl.TSRainbowYellow = { link = 'rainbowcol7' }
      end,
    },
  },
  {
    'loctvl842/monokai-pro.nvim',
    opts = {
      terminal_colors = true,
      devicons = true, -- highlight the icons of `nvim-web-devicons`
      filter = 'pro',  -- classic | octagon | pro | machine | ristretto | spectrum
      plugins = {
        indent_blankline = {
          context_highlight = 'pro', -- default | pro
          context_start_underline = false,
        },
      },
    },
  },
  {
    'EdenEast/nightfox.nvim',
    opts = {
      options = {
        module_default = false,
        modules = {
          aerial = true,
          cmp = true,
          ['dap-ui'] = true,
          dashboard = true,
          diagnostic = true,
          gitsigns = true,
          native_lsp = true,
          neotree = true,
          notify = true,
          symbol_outline = true,
          telescope = true,
          treesitter = true,
          whichkey = true,
        },
      },
      groups = { all = { NormalFloat = { link = 'Normal' } } },
    },
  },
  {
    'olivercederborg/poimandres.nvim',
    name = 'poimandres',
    opts = {
      -- leave this setup function empty for default config
      bold_vert_split = false,          -- use bold vertical separators
      dim_nc_background = false,        -- dim 'non-current' window backgrounds
      disable_background = false,       -- disable background
      disable_float_background = false, -- disable background for floats
      disable_italics = false,          -- disable italics
    },
  },
}
