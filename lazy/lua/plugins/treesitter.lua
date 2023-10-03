return {
  {
    'code-biscuits/nvim-biscuits',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    },
    opts = {
      default_config = {
        max_length = 12,
        min_distance = 5,
        prefix_string = " 📎 "
      },
      language_config = {
        html = {
          prefix_string = " 🌐 "
        },
        javascript = {
          prefix_string = " ✨ ",
          max_length = 80
        },
        python = {
          disabled = true
        }
      }
    }
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'BufReadPre',
    enabled = true,
    opts = { mode = 'cursor' },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      { 'windwp/nvim-ts-autotag',     opts = {} },
      { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' },
      'nvim-treesitter/nvim-treesitter-refactor',
    },
    opts = {
      ensure_installed = {
        'astro',
        'bash',
        'c_sharp',
        'c',
        'clojure',
        'cmake',
        'comment', -- comments are slowing down TS bigtime, so disable for now
        'cpp',
        'css',
        'cuda',
        'dart',
        'diff',
        'fish',
        'gitignore',
        'go',
        'graphql',
        'html',
        'http',
        'java',
        'javascript',
        'jsdoc',
        'json',
        'jsonc',
        'lua',
        'luap',
        'markdown_inline',
        'markdown',
        'meson',
        'ninja',
        'nix',
        'norg',
        'objc',
        'org',
        'php',
        'proto',
        'python',
        'query',
        'regex',
        'rust',
        'scss',
        'sql',
        'svelte',
        'teal',
        'toml',
        'tsx',
        'typescript',
        'vhs',
        'vim',
        'vimdoc',
        'vue',
        'wgsl',
        'yaml',
      },
      matchup = {
        enable = true,
      },
      -- highlight = { enable = true },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { 'BufWrite', 'CursorHold' },
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25,        -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = true, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = 'o',
          toggle_hl_groups = 'i',
          toggle_injected_languages = 't',
          toggle_anonymous_nodes = 'a',
          toggle_language_display = 'I',
          focus_language = 'f',
          unfocus_language = 'F',
          update = 'R',
          goto_node = '<cr>',
          show_help = '?',
        },
      },
      refactor = {
        highlight_definitions = {
          enable = true,
          -- Set to false if you have an `updatetime` of ~100.
          clear_on_cursor_move = true,
          highlight_current_scope = { enable = true },
          smart_rename = {
            enable = true,
            -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
            keymaps = {
              smart_rename = "grr",
            },
          },
        },
        navigation = {
          enable = true,
          -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
          keymaps = {
            goto_definition = "gnd",
            list_definitions = "gnD",
            list_definitions_toc = "gO",
            goto_next_usage = "<a-*>",
            goto_previous_usage = "<a-#>",
          },
        },
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',

  },
}
