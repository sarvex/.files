if vim.env.VSCODE then
  vim.g.vscode = true
end


vim.api.nvim_create_autocmd('User', {
  pattern = 'LazyVimStarted',
  callback = function()
    vim.schedule(function()
      -- require('util.profiler').stop()
    end)
  end,
})

-- bootstrap lazy.nvim, LazyVim and your plugins
require 'config.lazy'
