return {
  -- Add the community repository of plugin specifications
  'AstroNvim/astrocommunity',
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = 'astrocommunity.colorscheme.catppuccin' },
  -- { import = 'astrocommunity.completion.copilot-lua-cmp' },

  { import = 'astrocommunity.bars-and-lines.bufferline-nvim' },
  { import = 'astrocommunity.bars-and-lines.dropbar-nvim' },
  { import = 'astrocommunity.bars-and-lines.lualine-nvim' },
  { import = 'astrocommunity.bars-and-lines.scope-nvim' },
  { import = 'astrocommunity.bars-and-lines.smartcolumn-nvim' },
  { import = 'astrocommunity.bars-and-lines.statuscol-nvim',              opts = { colorcolumn = '120', }, },
  { import = 'astrocommunity.bars-and-lines.vim-illuminate' },

  { import = 'astrocommunity.code-runner.compiler-nvim' },
  { import = 'astrocommunity.code-runner.executor-nvim' },
  { import = 'astrocommunity.code-runner.sniprun' },

  { import = 'astrocommunity.color.headlines-nvim' },
  { import = 'astrocommunity.color.mini-hiplatterns' },
  { import = 'astrocommunity.color.modes-nvim' },
  { import = 'astrocommunity.color.tint-nvim' },
  { import = 'astrocommunity.color.twilight-nvim' },
  { import = 'astrocommunity.color.vim-highlighter' },

  { import = 'astrocommunity.colorscheme.catppuccin' },
  { import = 'astrocommunity.colorscheme.dracula-nvim' },
  { import = 'astrocommunity.colorscheme.everforest' },
  { import = 'astrocommunity.colorscheme.fluormachine-nvim' },
  { import = 'astrocommunity.colorscheme.github-nvim-theme' },
  { import = 'astrocommunity.colorscheme.gruvbox-baby' },
  { import = 'astrocommunity.colorscheme.gruvbox-nvim' },
  { import = 'astrocommunity.colorscheme.helix-nvim' },
  { import = 'astrocommunity.colorscheme.iceberg-vim' },
  { import = 'astrocommunity.colorscheme.kanagawa-nvim' },
  { import = 'astrocommunity.colorscheme.melange-nvim' },
  { import = 'astrocommunity.colorscheme.mellow-nvim' },
  { import = 'astrocommunity.colorscheme.mini-base16' },
  { import = 'astrocommunity.colorscheme.monokai-pro-nvim' },
  { import = 'astrocommunity.colorscheme.neosolarized-nvim' },
  { import = 'astrocommunity.colorscheme.nightfox-nvim' },
  { import = 'astrocommunity.colorscheme.nord-nvim' },
  { import = 'astrocommunity.colorscheme.nvim-juliana' },
  { import = 'astrocommunity.colorscheme.onedarkpro-nvim' },
  { import = 'astrocommunity.colorscheme.oxocarbon-nvim' },
  { import = 'astrocommunity.colorscheme.poimandres-nvim' },
  { import = 'astrocommunity.colorscheme.rose-pine' },
  { import = 'astrocommunity.colorscheme.sonokai' },
  { import = 'astrocommunity.colorscheme.tokyonight-nvim' },
  { import = 'astrocommunity.colorscheme.vscode-nvim' },

  { import = 'astrocommunity.completion.cmp-cmdline' },
  { import = 'astrocommunity.completion.codeium-vim' },
  { import = 'astrocommunity.completion.tabnine-nvim' },

  { import = 'astrocommunity.debugging.nvim-bqf' },
  { import = 'astrocommunity.debugging.nvim-dap-virtual-text' },
  { import = 'astrocommunity.debugging.persistent-breakpoints-nvim' },
  { import = 'astrocommunity.debugging.telescope-dap-nvim' },

  { import = 'astrocommunity.diagnostics.lsp_lines-nvim' },
  { import = 'astrocommunity.diagnostics.trouble-nvim' },

  { import = 'astrocommunity.editing-support.auto-save-nvim' },
  { import = 'astrocommunity.editing-support.chatgpt-nvim' },
  { import = 'astrocommunity.editing-support.comment-box-nvim' },
  { import = 'astrocommunity.editing-support.cutlass-nvim' },
  { import = 'astrocommunity.editing-support.dial-nvim' },
  { import = 'astrocommunity.editing-support.hypersonic-nvim' },
  { import = 'astrocommunity.editing-support.mini-splitjoin' },
  { import = 'astrocommunity.editing-support.multicursors-nvim' },
  { import = 'astrocommunity.editing-support.neogen' },
  { import = 'astrocommunity.editing-support.rainbow-delimiters-nvim' },
  { import = 'astrocommunity.editing-support.refactoring-nvim' },
  { import = 'astrocommunity.editing-support.suda-vim' },
  { import = 'astrocommunity.editing-support.text-case-nvim' },
  { import = 'astrocommunity.editing-support.telescope-undo-nvim' },
  { import = 'astrocommunity.editing-support.todo-comments-nvim' },
  { import = 'astrocommunity.editing-support.treesj' },
  { import = 'astrocommunity.editing-support.true-zen-nvim' },
  { import = 'astrocommunity.editing-support.ultimate-autopair-nvim' },
  { import = 'astrocommunity.editing-support.vim-move' },

  { import = 'astrocommunity.file-explorer.oil-nvim' },

  { import = 'astrocommunity.git.git-blame-nvim' },
  { import = 'astrocommunity.git.neogit' },
  { import = 'astrocommunity.git.octo-nvim' },
  { import = 'astrocommunity.git.openingh-nvim' },

  { import = 'astrocommunity.indent.indent-blankline-nvim' },
  { import = 'astrocommunity.indent.indent-tools-nvim' },
  { import = 'astrocommunity.indent.mini-indentscope' },

  { import = 'astrocommunity.lsp.inc-rename-nvim' },
  { import = 'astrocommunity.lsp.lsp-inlayhints-nvim' },

  { import = 'astrocommunity.markdown-and-latex.glow-nvim' },
  { import = 'astrocommunity.markdown-and-latex.markdown-preview-nvim' },
  { import = 'astrocommunity.markdown-and-latex.markmap-nvim' },
  { import = 'astrocommunity.markdown-and-latex.peek-nvim' },
  -- { import = 'astrocommunity.markdown-and-latex.vimtex' },

  { import = 'astrocommunity.media.presence-nvim' },
  { import = 'astrocommunity.media.vim-wakatime' },

  { import = 'astrocommunity.motion.flash-nvim' },
  { import = 'astrocommunity.motion.grapple-nvim' },
  { import = 'astrocommunity.motion.harpoon' },
  { import = 'astrocommunity.motion.mini-ai' },
  { import = 'astrocommunity.motion.mini-basics' },
  { import = 'astrocommunity.motion.mini-bracketed' },
  { import = 'astrocommunity.motion.mini-move' },
  { import = 'astrocommunity.motion.mini-surround' },
  { import = 'astrocommunity.motion.nvim-spider' },
  { import = 'astrocommunity.motion.portal-nvim' },
  { import = 'astrocommunity.motion.vim-matchup' },

  { import = 'astrocommunity.note-taking.neorg' },
  { import = 'astrocommunity.note-taking.obsidian-nvim' },

  { import = 'astrocommunity.pack.angular' },
  { import = 'astrocommunity.pack.astro' },
  { import = 'astrocommunity.pack.bash' },
  { import = 'astrocommunity.pack.clojure' },
  { import = 'astrocommunity.pack.cmake' },
  { import = 'astrocommunity.pack.cpp' },
  { import = 'astrocommunity.pack.cs' },
  { import = 'astrocommunity.pack.dart' },
  { import = 'astrocommunity.pack.docker' },
  { import = 'astrocommunity.pack.full-dadbod' },
  { import = 'astrocommunity.pack.go' },
  -- { import = 'astrocommunity.pack.haskell' },
  -- { import = 'astrocommunity.pack.haxe' },
  { import = 'astrocommunity.pack.html-css' },
  { import = 'astrocommunity.pack.java' },
  { import = 'astrocommunity.pack.json' },
  { import = 'astrocommunity.pack.julia' },
  { import = 'astrocommunity.pack.kotlin' },
  { import = 'astrocommunity.pack.lua' },
  { import = 'astrocommunity.pack.markdown' },
  { import = 'astrocommunity.pack.nix' },
  -- { import = 'astrocommunity.pack.php' },
  { import = 'astrocommunity.pack.prisma' },
  { import = 'astrocommunity.pack.proto' },
  { import = 'astrocommunity.pack.ps1' },
  { import = 'astrocommunity.pack.python' },
  -- { import = 'astrocommunity.pack.ruby' },
  { import = 'astrocommunity.pack.rust' },
  { import = 'astrocommunity.pack.svelte' },
  { import = 'astrocommunity.pack.tailwindcss' },
  { import = 'astrocommunity.pack.terraform' },
  { import = 'astrocommunity.pack.toml' },
  { import = 'astrocommunity.pack.typescript-all-in-one' },
  { import = 'astrocommunity.pack.vue' },
  { import = 'astrocommunity.pack.yaml' },

  { import = 'astrocommunity.programming-language-support.csv-vim' },
  { import = 'astrocommunity.programming-language-support.nvim-jqx' },
  { import = 'astrocommunity.programming-language-support.rest-nvim' },
  { import = 'astrocommunity.programming-language-support.web-tools-nvim' },
  { import = 'astrocommunity.project.nvim-spectre' },
  { import = 'astrocommunity.project.projectmgr-nvim' },

  { import = 'astrocommunity.search.nvim-hlslens' },

  { import = 'astrocommunity.scrolling.mini-animate' },
  { import = 'astrocommunity.scrolling.neoscroll-nvim' },
  { import = 'astrocommunity.scrolling.nvim-scrollbar' },

  { import = 'astrocommunity.split-and-window.edgy-nvim' },
  { import = 'astrocommunity.split-and-window.windows-nvim' },

  { import = 'astrocommunity.syntax.hlargs-nvim' },
  { import = 'astrocommunity.syntax.vim-cool' },
  { import = 'astrocommunity.syntax.vim-easy-align' },

  { import = 'astrocommunity.terminal-integration.flatten-nvim' },

  { import = 'astrocommunity.test.neotest' },
  { import = 'astrocommunity.test.nvim-coverage' },

  { import = 'astrocommunity.utility.neodim' },
  { import = 'astrocommunity.utility.noice-nvim' },
  { import = 'astrocommunity.utility.nvim-toggler' },
  { import = 'astrocommunity.utility.telescope-fzy-native-nvim' },
  { import = 'astrocommunity.utility.telescope-live-grep-args-nvim' },
  { import = 'astrocommunity.utility.transparent-nvim' },

  { import = 'astrocommunity.workflow.bad-practices-nvim' },
  --  { import = 'astrocommunity.workflow.hardtime-nvim' },
}
