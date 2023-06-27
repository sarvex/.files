-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.guifont = 'Hack Nerd Font Mono,NotoMono Nerd Font Mono:h11'


vim.g.neovide_background_color = '#0f1117' .. string.format('%x', math.floor(255 * 0.8))
vim.g.neovide_cursor_animate_command_line = true
vim.g.neovide_cursor_animate_in_insert_mode = true
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_trail_size = 0.8
vim.g.neovide_cursor_unfocused_outline_width = 0.125
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
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_left = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_top = 0
vim.g.neovide_remember_window_size = true
vim.g.neovide_scroll_animation_length = 0.25
vim.g.neovide_transparency = 0.8
