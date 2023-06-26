-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    'williamboman/mason-lspconfig.nvim',
    -- overrides `require('mason-lspconfig').setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require('astronvim.utils').list_insert_unique(opts.ensure_installed, {
        "clangd",
        "cssls",
        "gopls",
        "html",
        "intelephense",
        "marksman",
        "neocmake",
        "jsonls",
        "julials",
        "pyright",
        "lua_ls",
        "taplo",
        "texlab",
        "tsserver",
        "yamlls",
      })
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    'jay-babu/mason-null-ls.nvim',
    -- overrides `require('mason-null-ls').setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require('astronvim.utils').list_insert_unique(opts.ensure_installed, {
        "shellcheck",
        "stylua",
        "black",
        "isort",
        "prettierd",
        "shfmt",
        "shellcheck",
      })
    end,
    config = function(_, opts)
      local mason_null_ls = require "mason-null-ls"
      local null_ls = require "null-ls"
      mason_null_ls.setup(opts)
      mason_null_ls.setup {
        prettierd = function()
          null_ls.register(null_ls.builtins.formatting.prettierd.with { extra_filetypes = { "json", "markdown" } })
        end,
      }
    end,
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    -- overrides `require('mason-nvim-dap').setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require('astronvim.utils').list_insert_unique(opts.ensure_installed, {
        "bash",
        "bzl",
        "cppdbg",
        "cpptools",
        "elixir_ls",
        "erlang_ls",
        "delve",
        "go-debug-adapter",
        "haskell-debug-adapter",
        "js",
        "kotlin-debug-adapter",
        "netcoredbg",
        "node-debug2-adapter",
        "php",
        "python",
      })
    end,
  },
}
