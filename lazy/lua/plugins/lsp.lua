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
        'cucumber-language-server',
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
        'foam-language-server',
        'gitleaks',
        'gitlint',
        'gleam',
        'glint',
        'golangci-lint-langserver',
        'gradle-language-server',
        'grammarly',
        'graphql',
        'groovyls',
        'haml-lint',
        'haskell-language-server',
        'haxe-language-server',
        'helm-ls',
        'hls',
        'htmx-lsp',
        'isort',
        'java-language-server',
        'jedi-language-server',
        'joker',
        'jq-lsp',
        'jsonld-lsp',
        'jsonnet-language-server',
        'julia-lsp',
        'kotlin-language-server',
        'lean-langugage-server',
        'llm-ls',
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
        'nil',
        'minlangserver',
        'nimlsp',
        'ocaml-lsp',
        'omnisharp-mono',
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
        'stylua',
        'svelte-language-server',
        'swift-mesonlsp',
        'synk-ls',
        'tailwindcss-language-server',
        'taplo',
        'thriftls',
        'unocss-language-server',
        'vala-language-server',
        'vue-language-server',
      })
    end,
  },

  {
    'jay-babu/mason-nvim-dap.nvim',
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
        'go',
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
        nls.builtins.code_actions.eslint_d,
        nls.builtins.code_actions.gitsigns.with({
          config = {
            filter_actions = function(title)
              return title:lower():match("blame") == nil -- filter out blame actions
            end,
          },
        }),
        nls.builtins.code_actions.gomodifytags,
        nls.builtins.code_actions.impl,
        nls.builtins.code_actions.ltrs,
        nls.builtins.code_actions.proselint,
        nls.builtins.code_actions.refactoring,
        nls.builtins.code_actions.shellcheck,
        nls.builtins.code_actions.statix,
        nls.builtins.code_actions.ts_node_action,
        nls.builtins.completion.luasnip,
        nls.builtins.completion.spell,
        nls.builtins.completion.tags,
        nls.builtins.completion.vsnip,
        nls.builtins.diagnostics.actionlint,
        nls.builtins.diagnostics.alex,
        nls.builtins.diagnostics.ansiblelint,
        nls.builtins.diagnostics.bandit,
        nls.builtins.diagnostics.buf,
        nls.builtins.diagnostics.buildifier,
        nls.builtins.diagnostics.cfn_lint,
        nls.builtins.diagnostics.checkmake,
        nls.builtins.diagnostics.checkstyle.with({
          extra_args = { "-c", "/google_checks.xml" }, -- or "/sun_checks.xml" or path to self written rules
        }),
        nls.builtins.diagnostics.chktex,
        nls.builtins.diagnostics.clang_check,
        nls.builtins.diagnostics.clj_kondo,
        nls.builtins.diagnostics.cmake_lint,
        nls.builtins.diagnostics.codespell,
        nls.builtins.diagnostics.commitlint,
        nls.builtins.diagnostics.cppcheck,
        nls.builtins.diagnostics.cpplint,
        nls.builtins.diagnostics.credo,
        nls.builtins.diagnostics.curlylint,
        nls.builtins.diagnostics.deadnix,
        nls.builtins.diagnostics.deno_lint,
        nls.builtins.diagnostics.djlint,
        nls.builtins.diagnostics.dotenv_linter,
        nls.builtins.diagnostics.editorconfig_checker,
        nls.builtins.diagnostics.erb_lint,
        nls.builtins.diagnostics.eslint_d,
        nls.builtins.diagnostics.fish,
        nls.builtins.diagnostics.flake8,
        nls.builtins.diagnostics.gccdiag,
        nls.builtins.diagnostics.gdlint,
        nls.builtins.diagnostics.gitlint,
        nls.builtins.diagnostics.glslc.with({
          extra_args = { "--target-env=opengl" }, -- use opengl instead of vulkan1.0
        }),
        nls.builtins.diagnostics.golangci_lint,
        nls.builtins.diagnostics.gospel,
        nls.builtins.diagnostics.hadolint,
        nls.builtins.diagnostics.haml_lint,
        nls.builtins.diagnostics.jshint,
        nls.builtins.diagnostics.jsonlint,
        nls.builtins.diagnostics.ktlint,
        nls.builtins.diagnostics.ltrs,
        nls.builtins.diagnostics.luacheck.with({
          condition = function(utils)
            return utils.root_has_file({ '.luacheckrc' })
          end,
        }),
        nls.builtins.diagnostics.markdownlint,
        nls.builtins.diagnostics.markuplint,
        nls.builtins.diagnostics.mdl,
        nls.builtins.diagnostics.misspell,
        nls.builtins.diagnostics.mlint,
        nls.builtins.diagnostics.npm_groovy_lint,
        nls.builtins.diagnostics.perlimports,
        nls.builtins.diagnostics.php,
        nls.builtins.diagnostics.phpcs,
        nls.builtins.diagnostics.phpmd,
        nls.builtins.diagnostics.phpstan,
        nls.builtins.diagnostics.pmd.with({
          extra_args = {
            "--rulesets",
            "category/java/bestpractices.xml,category/jsp/bestpractices.xml" -- or path to self-written ruleset
          },
        }),
        nls.builtins.diagnostics.proselint,
        nls.builtins.diagnostics.protoc_gen_lint,
        nls.builtins.diagnostics.protolint,
        nls.builtins.diagnostics.psalm,
        nls.builtins.diagnostics.puglint,
        nls.builtins.diagnostics.puppet_lint,
        nls.builtins.diagnostics.pycodestyle,
        nls.builtins.diagnostics.pydocstyle,
        nls.builtins.diagnostics.qmllint,
        nls.builtins.diagnostics.reek,
        nls.builtins.diagnostics.revive,
        nls.builtins.diagnostics.rstcheck,
        nls.builtins.diagnostics.rubocop,
        nls.builtins.diagnostics.ruff,
        nls.builtins.diagnostics.semgrep,
        nls.builtins.diagnostics.semistandardjs,
        nls.builtins.diagnostics.shellcheck,
        nls.builtins.diagnostics.solhint,
        nls.builtins.diagnostics.spectral,
        nls.builtins.diagnostics.sqlfluff.with({
          extra_args = { "--dialect", "postgres" }, -- change to your dialect
        }),
        nls.builtins.diagnostics.standardjs,
        nls.builtins.diagnostics.standardrb,
        nls.builtins.diagnostics.staticcheck,
        nls.builtins.diagnostics.statix,
        nls.builtins.diagnostics.stylelint,
        nls.builtins.diagnostics.stylint,
        nls.builtins.diagnostics.swiftlint,
        nls.builtins.diagnostics.teal,
        nls.builtins.diagnostics.terraform_validate,
        nls.builtins.diagnostics.textidote,
        nls.builtins.diagnostics.textlint,
        nls.builtins.diagnostics.tfsec,
        nls.builtins.diagnostics.tidy,
        nls.builtins.diagnostics.todo_comments,
        nls.builtins.diagnostics.trail_space,
        nls.builtins.diagnostics.tsc,
        nls.builtins.diagnostics.twigcs,
        nls.builtins.diagnostics.typos,
        nls.builtins.diagnostics.vacuum,
        nls.builtins.diagnostics.vale,
        nls.builtins.diagnostics.verilator,
        nls.builtins.diagnostics.vint,
        nls.builtins.diagnostics.vulture,
        nls.builtins.diagnostics.write_good,
        nls.builtins.diagnostics.yamllint,
        nls.builtins.diagnostics.zsh,
        nls.builtins.formatting.black,
        nls.builtins.formatting.dprint.with({
          condition = function(utils)
            return utils.root_has_file({ 'dprint.json' }) or vim.loop.fs_stat('dprint.json')
          end,
        }),
        nls.builtins.formatting.isort,
        nls.builtins.formatting.prettier.with({ filetypes = { 'markdown' } }),
        nls.builtins.diagnostics.selene.with({
          condition = function(utils)
            return utils.root_has_file({ 'selene.toml' })
          end,
        }),
        nls.builtins.formatting.stylua,

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
