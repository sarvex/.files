-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
return {
  update_in_insert = false,
  virtual_text = true,
  underline = true,
  -- virtual_lines = false,
  virtual_lines = {
    only_current_line = true,
  },
}
