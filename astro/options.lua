-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  g = {
    autoformat_enabled = true,  -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    autopairs_enabled = true,   -- enable autopairs at start
    cmp_enabled = true,         -- enable completion at start
    diagnostics_enabled = true, -- enable diagnostics at start
    diagnostics_mode = 3,       -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true,       -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    mapleader = ' ',            -- sets vim.g.mapleader
    neovide_background_color = '#0f1117' .. string.format('%x', math.floor(255 * 0.8)),
    neovide_cursor_animate_command_line = true,
    neovide_cursor_animate_in_insert_mode = true,
    neovide_cursor_antialiasing = true,
    neovide_cursor_vfx_mode = 'railgun',
    neovide_cursor_vfx_opacity = 200.0,
    neovide_cursor_vfx_particle_curl = 1.0,
    neovide_cursor_vfx_particle_density = 15,
    neovide_cursor_vfx_particle_lifetime = 1.5,
    neovide_cursor_vfx_particle_phase = 1.5,
    neovide_cursor_vfx_particle_speed = 10.0,
    neovide_floating_blur_amount_x = 2.0,
    neovide_floating_blur_amount_y = 2.0,
    neovide_fullscreen = true,
    neovide_remember_window_size = true,
    neovide_transparency = 0.6,
    resession_enabled = true,          -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
    status_diagnostics_enabled = true, -- enable diagnostics in statusline
    ui_notifications_enabled = true,   -- disable notifications when toggling UI elements
  },
  opt = {
    autoindent = true,
    autoread = true,
    conceallevel = 2, -- enable conceal
    expandtab = true,
    foldenable = false,
    foldexpr = 'nvim_treesitter#foldexpr()', -- set Treesitter based folding
    foldmethod = 'expr',
    guifont = 'Hack Nerd Font Mono,NotoMono Nerd Font Mono:h11',
    number = true,         -- sets vim.opt.number
    relativenumber = true, -- sets vim.opt.relativenumber
    shell = vim.fn.executable 'pwsh' and 'pwsh' or 'powershell',
    shellcmdflag =
    '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;',
    shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode',
    shellquote = '',
    shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait',
    shellxquote = '',
    shiftwidth = 2,
    showtabline = (vim.t.bufs and #vim.t.bufs > 1) and 2 or 1,
    signcolumn = 'auto', -- sets vim.opt.signcolumn to auto
    smartindent = true,
    spell = true,        -- sets vim.opt.spell
    splitkeep = 'screen',
    swapfile = false,
    tabstop = 2,
    wrap = false, -- sets vim.opt.wrap
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
