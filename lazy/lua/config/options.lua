-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local vim = vim
local opt = vim.opt
local g = vim.g

-- Globals
g.autoformat_enabled = true
g.autopairs_enabled = true
g.cmp_enabled = true
g.diagnostics_enabled = true
g.diagnostics_mode = 3
g.icons_enabled = true
g.mapleader = " "
g.neovide_background_color = "#0f1117" .. string.format("%x", math.floor(255 * 0.8))
g.neovide_cursor_animate_command_line = true
g.neovide_cursor_animate_in_insert_mode = true
g.neovide_cursor_antialiasing = true
g.neovide_cursor_vfx_mode = "railgun"
g.neovide_cursor_vfx_opacity = 200.0
g.neovide_cursor_vfx_particle_curl = 1.0
g.neovide_cursor_vfx_particle_density = 15
g.neovide_cursor_vfx_particle_lifetime = 1.5
g.neovide_cursor_vfx_particle_phase = 1.5
g.neovide_cursor_vfx_particle_speed = 10.0
g.neovide_floating_blur_amount_x = 2.0
g.neovide_floating_blur_amount_y = 2.0
g.neovide_fullscreen = true
g.neovide_remember_window_size = true
g.status_diagnostics_enabled = true

-- Options
opt.autoindent = true
opt.autoread = true
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldmethod = "expr"
opt.guifont = "Hack Nerd Font Mono,NotoMono Nerd Font Mono:h11"
opt.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"
opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
opt.shellquote = ""
opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
opt.shellxquote = ""
opt.showtabline = (vim.t.bufs and #vim.t.bufs > 1) and 2 or 1
opt.spell = true
