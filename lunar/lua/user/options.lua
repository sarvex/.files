-- general
lvim.format_on_save = true

-- predefined plugins
lvim.builtin.treesitter.ensure_installed = 'maintained'
lvim.builtin.treesitter.highlight.enable = true

-- default formatter override
lvim.lang.python.formatter = {
  exe = 'black',
}

-- additional linters
lvim.lang.python.linters = {
  exe = 'flake8'
}

lvim.builtin.which_key.mappings['t'] = {
  name = '+Trouble',
  r = { "<cmd>Trouble lsp_references<cr>","References" },
  f = { "<cmd>Trouble lsp_definitions<cr>","Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>","Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>","QuickFix" },
  l = { "<cmd>Trouble loclist<cr>","LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>","Workspace Diagnostics" },
}
