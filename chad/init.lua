local autocmd = vim.api.nvim_create_autocmd

-- Globals
vim.g.autoformat_enabled = true
vim.g.autopairs_enabled = true
vim.g.cmp_enabled = true
vim.g.diagnostics_enabled = true
vim.g.diagnostics_mode = 3
vim.g.icons_enabled = true
vim.g.mapleader = ' '
vim.g.neovide_background_color = '#0f1117' .. string.format('%x', math.floor(255 * 0.8))
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_vfx_mode = 'railgun'
vim.g.neovide_cursor_vfx_opacity = 200.0
vim.g.neovide_cursor_vfx_particle_curl = 1.0
vim.g.neovide_cursor_vfx_particle_density = 15
vim.g.neovide_cursor_vfx_particle_lifetime = 1.5
vim.g.neovide_cursor_vfx_particle_phase = 1.5
vim.g.neovide_cursor_vfx_particle_speed = 10.0
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.g.neovide_fullscreen = true
vim.g.neovide_remember_window_size = true
vim.g.neovide_transparency = 0.6
vim.g.status_diagnostics_enabled = true

-- Options
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.conceallevel = 2
vim.opt.expandtab = true
vim.opt.foldenable = false
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldmethod = 'expr'
vim.opt.guifont = 'Hack Nerd Font Mono,NotoMono Nerd Font Mono:h11'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shell = vim.fn.executable 'pwsh' and 'pwsh' or 'powershell'
vim.opt.shellcmdflag =
'-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
vim.opt.shellquote = ''
vim.opt.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
vim.opt.shellxquote = ''
vim.opt.shiftwidth = 2
vim.opt.showtabline = (vim.t.bufs and #vim.t.bufs > 1) and 2 or 1
vim.opt.signcolumn = 'auto'
vim.opt.smartindent = true
vim.opt.spell = true
vim.opt.splitkeep = 'screen'
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.wrap = false

-- Auto resize panes when resizing nvim window
autocmd('VimResized', {
  pattern = '*',
  command = 'tabdo wincmd =',
})
