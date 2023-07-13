return {
  {
    'mason-nvim-dap.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        'bash',
        'cppdbg',
        'delve',
        'js',
        'php',
        'python',
      })
    end,
  },

  -- {
  --   'sainnhe/gruvbox-material',
  --   priority = 10000,
  --   lazy = false,
  --   config = function()
  --     vim.g.gruvbox_material_foreground = 'original'
  --     vim.g.gruvbox_material_background = 'medium'
  --     vim.cmd.colorscheme('gruvbox-material')
  --   end,
  -- },
}
