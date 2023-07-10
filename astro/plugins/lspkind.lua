return {
  'onsails/lspkind.nvim',
  opts = function(_, opts)
    -- use codicons preset
    opts.preset = 'codicons'
    -- set some missing symbol types
    opts.symbol_map = {
      Array = '',
      Boolean = '',
      Class = " ",
      Color = " ",
      Constant = " ",
      Constructor = " ",
      Enum = " ",
      EnumMember = " ",
      Event = " ",
      Field = " ",
      File = " ",
      Folder = " ",
      Function = " ",
      Interface = " ",
      Key = '',
      Keyword = " ",
      Method = " ",
      Module = " ",
      Namespace = '',
      Null = '',
      Number = '',
      Object = '',
      Operator = " ",
      Package = '',
      Property = " ",
      Reference = " ",
      Snippet = " ",
      String = '',
      Struct = " ",
      Text = " ",
      TypeParameter = " ",
      Unit = " ",
      Value = " ",
      Variable = " ",
    }
    return opts
  end,
}
