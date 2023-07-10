return {
  { 'rcarriga/nvim-notify', init = false, config = true },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if opts.ensure_installed ~= 'all' then
        opts.ensure_installed = require('astronvim.utils').list_insert_unique(
          opts.ensure_installed,
          { 'bash', 'markdown', 'markdown_inline', 'regex', 'vim' }
        )
      end
    end,
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      cmdline = { view = 'cmdline' },
      messages = { view_search = false },
      lsp = {
        ["cmp.entry.get_documentation"] = true,
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        hover = { enabled = false },
        progress = { enabled = false },
        signature = { enabled = false },
      },
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
      routes = {
        { filter = { event = 'msg_show', find = '%d+L,%s%d+B' },        opts = { skip = true } }, -- skip save notifications
        { filter = { event = 'msg_show', find = '^%d+ more lines$' },   opts = { skip = true } }, -- skip paste notifications
        { filter = { event = 'msg_show', find = '^%d+ fewer lines$' },  opts = { skip = true } }, -- skip delete notifications
        { filter = { event = 'msg_show', find = '^%d+ lines yanked$' }, opts = { skip = true } }, -- skip yank notifications
        { filter = { event = 'msg_show', min_height = 20 },             view = 'messages' },      -- send long messages to split
      },
    },
  },
}
