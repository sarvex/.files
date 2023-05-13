
-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config = {
  font = wezterm.font('Delugia', { weight = 'DemiLight', italic = true }),
  window_background_opacity = 0.8,
  use_fancy_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  check_for_updates = true,
  color_scheme = "AdventureTime",
  tab_bar_at_bottom = true,
  font_size = 11.0,
  default_prog = { "pwsh.exe", "-NoLogo" },
}

-- Equivalent to POSIX basename(3)
-- Given "/foo/bar" returns "bar"
-- Given "c:\\foo\\bar" returns "bar"
function basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane
  local title = basename(pane.foreground_process_name)
  return {
    { Text = " " .. title .. " " },
  }
end)
-- and finally, return the configuration to wezterm
return config
