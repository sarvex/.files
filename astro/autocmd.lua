vim.api.nvim_create_augroup('DiagnosticMode', { clear = true })
vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = { 'i', 'v' },
  group = 'DiagnosticMode',
  callback = function()
    if vim.lsp.buf.server_ready() then vim.diagnostic.hide() end
  end,
})

vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = 'n',
  group = 'DiagnosticMode',
  callback = function()
    if vim.lsp.buf.server_ready() then vim.diagnostic.show() end
  end,
})
