---@type UserConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "user.highlights"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "user.plugins"

-- check core.mappings for table structure
M.mappings = require "user.mappings"

return M
