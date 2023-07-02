return {
  { 'tiagovla/scope.nvim',       event = 'VeryLazy', opts = {} },
  { 'akinsho/bufferline.nvim',   event = 'VeryLazy', opts = {} },
  { 'Bekaboo/dropbar.nvim',      event = 'VeryLazy', opts = {} },
  { 'nvim-lualine/lualine.nvim', event = 'VeryLazy', opts = {} },
  { 'tiagovla/scope.nvim',       event = 'VeryLazy', opts = {} },
  { 'luukvbaal/statuscol.nvim',  lazy = false,       opts = {} },
  {
    'm4xshen/smartcolumn.nvim',
    event = { 'InsertEnter', 'User AstroFile' },
    opts = { colorcolumn = '120', },
  },
  {
    'rebelot/heirline.nvim',
    optional = true,
    opts = function(_, opts)
      opts.tabline = nil
      opts.winbar = nil
      opts.statusline = nil
      opts.statuscolumn = nil
    end,
  },
}
