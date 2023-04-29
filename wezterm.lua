
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

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  config.term = "" -- Set to empty so FZF works on windows
  -- table.insert(config.launch_menu, { label = "PowerShell 5", args = { "powershell.exe", "-NoLogo" } })
  table.insert(config.launch_menu, { label = "PowerShell", args = { "pwsh.exe", "-NoLogo" } })
  table.insert(
    config.launch_menu,
    { label = "VS PowerShell 2022", args = { "powershell.exe", "-NoLogo", "-NoExit", "-Command", "devps 17.0" } }
  )
  table.insert(config.launch_menu, { label = "Command Prompt", args = { "cmd.exe" } })
  table.insert(config.launch_menu, {
    label = "VS Command Prompt 2022",
    args = { "powershell.exe", "-NoLogo", "-NoExit", "-Command", "devcmd 17.0" },
  })
else
  table.insert(config.launch_menu, { label = "zsh", args = { "zsh", "-l" } })
end

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
