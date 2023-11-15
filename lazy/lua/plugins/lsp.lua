return {
  -- tools
  {
    'williamboman/mason.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        'angular-language-server',
        'ansible-lint',
        'arduino-language-server',
        'asm-lsp',
        'astro-language-server',
        'awk-language-server',
        'bash-language-server',
        'biome',
        'black',
        'brighterscript',
        'buf-language-server',
        'buf',
        'bzl',
        'checkstyle',
        'clojure-lsp',
        'cmake-language-server',
        'codeql',
        'codespell',
        'commitlint',
        'cpplint',
        'crystalline',
        'csharp-language-server',
        'cspell',
        'css-lsp',
        'cssmodules-language-server',
        'cypher-language-server',
        'deno',
        'dhall-lsp',
        'diagnostic-languageserver',
        'dot-language-server',
        'elm-language-server',
        'ember-language-server',
        'emmet-language-server',
        'emmet-ls',
        'erlang-ls',
        'fennel-language-server',
        'flake8',
        'gitleaks',
        'gitlint',
        'gradle-language-server',
        'graphql',
        'groovyls',
        'haml-lint',
        'haxe-language-server',
        'helm-ls',
        'hls',
        'htmx-lsp',
        'isort',
        'java-language-server',
        'joker',
        'jsonnet-language-server',
        'julia-lsp',
        'kotlin-language-server',
        'ltex-ls',
        'lua-language-server',
        'luacheck',
        'luaformatter',
        'luau-lsp',
        'markdownlint-cli2',
        'matlab-language-server',
        'mdx-analyzer',
        'move-analyzer',
        'nextls',
        'nginx-language-server',
        'nimlsp',
        'ocaml-lsp',
        'opencl-language-server',
        'openedge-language-server',
        'openscad-lsp',
        'pest-language-server',
        'powershell-editor-services',
        'prettier',
        'prettierd',
        'prisma-language-server',
        'puppet-editor-services',
        'purescript-language-server',
        'r-languageserver',
        'raku-navigator',
        'reason-language-server',
        'remark-language-server',
        'ruff',
        'rust-analyzer',
        'selene',
        'shellcheck',
        'shfmt',
        'solang-llvm',
        'solhint',
        'solidity-ls',
        'sonarlint-language-server',
        'sourcery',
        'spectral-language-server',
        'sqlls',
        'stylelint-lsp',
        'stylelint',
        'stylua',
        'svelte-language-server',
        'swift-mesonlsp',
        'synk-ls',
        'synk',
        'tailwindcss-language-server',
        'taplo',
        'thriftls',
        'unocss-language-server',
        'vala-language-server',
        'vale',
        'vue-language-server',
        'yamllint',
      })
    end,
  },

  {
    'mason-nvim-dap.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        'bash',
        'chrome',
        'codelldb',
        'coreclr',
        'cpptools',
        'dart',
        'delve',
        'elixir',
        'firefox',
        'go-debug-adapter',
        'haskell',
        'javadbg',
        'javatest',
        'js',
        'kotlin',
        'mock',
        'node2',
        'perl-debug-adapter',
        'php',
        'puppet',
        'python',
        'vscode-java-decomplier'
      })
    end,
  },

  -- lsp servers
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'jose-elias-alvarez/typescript.nvim',
      init = function()
        require('lazyvim.util').lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set('n', '<leader>co', 'TypescriptOrganizeImports', { buffer = buffer, desc = 'Organize Imports' })
          vim.keymap.set('n', '<leader>cR', 'TypescriptRenameFile', { desc = 'Rename File', buffer = buffer })
        end)
      end,
    },
    opts = {
      inlay_hints = { enabled = true },
      diagnostics = { virtual_text = { prefix = 'icons' } },
      capabilities = {
        workspace = {
          didChangeWatchedFiles = {
            dynamicRegistration = false,
          },
        },
      },
      ---@type lspconfig.options
      servers = {
        ansiblels = {},
        bashls = {},
        clangd = {},
        denols = {},
        cssls = {},
        dockerls = {},
        eslint = {},
        gopls = {},
        html = {},
        lua_ls = {
          -- enabled = false,
          -- cmd = { '/home/folke/projects/lua-language-server/bin/lua-language-server' },
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = 'Both',
              },
              misc = {
                parameters = {
                  -- '--log-level=trace',
                },
              },
              hover = { expandAlias = false },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = 'Disable',
                semicolon = 'Disable',
                arrayIndex = 'Disable',
              },
              doc = {
                privateName = { '^_' },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                disable = { 'incomplete-signature-doc', 'trailing-space' },
                -- enable = false,
                groupSeverity = {
                  strong = 'Warning',
                  strict = 'Warning',
                },
                groupFileStatus = {
                  ['ambiguity'] = 'Opened',
                  ['await'] = 'Opened',
                  ['codestyle'] = 'None',
                  ['duplicate'] = 'Opened',
                  ['global'] = 'Opened',
                  ['luadoc'] = 'Opened',
                  ['redefined'] = 'Opened',
                  ['strict'] = 'Opened',
                  ['strong'] = 'Opened',
                  ['type-check'] = 'Opened',
                  ['unbalanced'] = 'Opened',
                  ['unused'] = 'Opened',
                },
                unusedLocalExclude = { '_*' },
              },
              format = {
                enable = true,
                defaultConfig = {
                  indent_style = 'space',
                  indent_size = '2',
                  continuation_indent_size = '2',
                },
              },
            },
          },
        },
        marksman = {},
        pyright = {},
        ruff_lsp = {},
        rust_analyzer = {
          settings = {
            ['rust-analyzer'] = {
              procMacro = { enable = true },
              cargo = { allFeatures = true },
              checkOnSave = {
                command = 'clippy',
                extraArgs = { '--no-deps' },
              },
            },
          },
        },
        svelte = {},
        tailwindcss = {
          root_dir = function(...)
            return require('lspconfig.util').root_pattern('.git')(...)
          end,
        },
        tsserver = {
          -- root_dir = function(...)
          --   return require('lspconfig.util').root_pattern('.git')(...)
          -- end,
          single_file_support = false,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = 'literal',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        vimls = {},
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
      },
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { 'utf-16' }
        end,
        eslint = function()
          require('lazyvim.util').lsp.on_attach(function(client)
            if client.name == 'eslint' then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == 'tsserver' then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
        tsserver = function(_, opts)
          require('typescript').setup({ server = opts })
          return true
        end,
      },
    },
  },

  -- null-ls
  {
    'nvimtools/none-ls.nvim',
    opts = function(_, opts)
      local nls = require('null-ls')
      vim.list_extend(opts.sources, {
        nls.builtins.formatting.dprint.with({
          condition = function(utils)
            return utils.root_has_file({ 'dprint.json' }) or vim.loop.fs_stat('dprint.json')
          end,
        }),
        nls.builtins.formatting.prettier.with({ filetypes = { 'markdown' } }),
        nls.builtins.diagnostics.markdownlint,
        nls.builtins.diagnostics.deno_lint,
        nls.builtins.diagnostics.selene.with({
          condition = function(utils)
            return utils.root_has_file({ 'selene.toml' })
          end,
        }),
        nls.builtins.formatting.isort,
        nls.builtins.formatting.black,
        nls.builtins.diagnostics.flake8,
        nls.builtins.diagnostics.luacheck.with({
          condition = function(utils)
            return utils.root_has_file({ '.luacheckrc' })
          end,
        }),
      })
    end,
  },

  {
    'mfussenegger/nvim-lint',
    opts = {
      linters_by_ft = {
        lua = { 'selene', 'luacheck' },
        markdown = { 'markdownlint' },
      },
      linters = {
        selene = {
          condition = function(ctx)
            return vim.fs.find({ 'selene.toml' }, { path = ctx.filename, upward = true })[1]
          end,
        },
        luacheck = {
          condition = function(ctx)
            return vim.fs.find({ '.luacheckrc' }, { path = ctx.filename, upward = true })[1]
          end,
        },
      },
    },
  },
}
