-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
return function()
  local function yaml_ft(path, bufnr)
    -- get content of buffer as string
    local content = vim.filetype.getlines(bufnr)
    if type(content) == 'table' then content = table.concat(content, '\n') end

    -- check if file is in roles, tasks, or handlers folder
    local path_regex = vim.regex '(tasks\\|roles\\|handlers)/'
    if path_regex and path_regex:match_str(path) then return 'yaml.ansible' end
    -- check for known ansible playbook text and if found, return yaml.ansible
    local regex = vim.regex 'hosts:\\|tasks:'
    if regex and regex:match_str(content) then return 'yaml.ansible' end

    -- return yaml if nothing else
    return 'yaml'
  end

  vim.filetype.add {
    extension = {
      qmd = 'markdown',
      yml = yaml_ft,
      yaml = yaml_ft,
    },
    pattern = {
      ['/tmp/neomutt.*'] = 'markdown',
    },
  }

  -- Set up custom filetypes
  -- vim.filetype.add {
  --   extension = {
  --     foo = 'fooscript',
  --   },
  --   filename = {
  --     ['Foofile'] = 'fooscript',
  --   },
  --   pattern = {
  --     ['~/%.config/foo/.*'] = 'fooscript',
  --   },
  -- }
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set('n', '<C-=>', function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set('n', '<C-->', function()
    change_scale_factor(1 / 1.25)
  end)

  require 'user.autocmds'
end
