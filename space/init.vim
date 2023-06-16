" # All SpaceVim option below [option] section
let g:spacevim_automatic_update = 1
let g:spacevim_buffer_index_type = 4
let g:spacevim_code_runner_focus = 1
let g:spacevim_colorscheme = 'gruvbox'
let g:spacevim_colorscheme_bg = 'dark'
let g:spacevim_enable_cursorline = 1
let g:spacevim_enable_googlesuggest = 1
let g:spacevim_enable_googlesuggest = 1
let g:spacevim_enable_guicolors = 1
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_enable_statusline_bfpath = 1
let g:spacevim_enable_statusline_mode = 1
let g:spacevim_enable_statusline_tag = 1
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_tabline_ft_icon = 1
let g:spacevim_filetree_direction = 'right'
let g:spacevim_github_username = 'sarvex'
let g:spacevim_guifont = 'Agave Nerd Font Mono:h11'
let g:spacevim_home_files_number = 16
let g:spacevim_project_rooter_outermost = 0
let g:spacevim_statusline_iseparator = 'slant'
let g:spacevim_statusline_separator = 'fire'
let g:spacevim_filetype_icons['md'] = ''
let g:spacevim_commandline_prompt = '➭'
let g:spacevim_src_root = '~\Source\'



let g:spacevim_custom_plugins = [
  \ ['Shougo/vimproc.vim'],
  \ ]

" # Enable autocomplete layer
call SpaceVim#layers#load('autocomplete',
  \ { 
  \   'auto_completion_return_key_behavior': 'complete',
  \   'auto_completion_tab_key_behavior' : 'smart'
  \ }
  \ )
  

call SpaceVim#layers#load('telescope')

call SpaceVim#layers#load('format')

call SpaceVim#layers#load('checkers')

call SpaceVim#layers#load('ctrlspace')

call SpaceVim#layers#load('games')

call SpaceVim#layers#load('git')

call SpaceVim#layers#load('github')

call SpaceVim#layers#load('gtags')

call SpaceVim#layers#load('lang#asciidoc')

call SpaceVim#layers#load('lang#assembly')

call SpaceVim#layers#load('lang#batch')

call SpaceVim#layers#load('lang#c',
\ {
\   'enable_clang_syntax_highlight': 1
\ }
\ )

call SpaceVim#layers#load('lang#clojure')

call SpaceVim#layers#load('lang#cmake')

call SpaceVim#layers#load('lang#crystal')

call SpaceVim#layers#load('lang#csharp')

call SpaceVim#layers#load('lang#d')

call SpaceVim#layers#load('lang#dart')

call SpaceVim#layers#load('lang#dockerfile')

call SpaceVim#layers#load('lang#e')

call SpaceVim#layers#load('lang#eiffel')

call SpaceVim#layers#load('lang#elixir')

call SpaceVim#layers#load('lang#elm')

call SpaceVim#layers#load('lang#erlang')

call SpaceVim#layers#load('lang#factor')

call SpaceVim#layers#load('lang#fortran')

call SpaceVim#layers#load('lang#fsharp')

call SpaceVim#layers#load('lang#go')

call SpaceVim#layers#load('lang#graphql')

call SpaceVim#layers#load('lang#haskell')

call SpaceVim#layers#load('lang#haxe')

call SpaceVim#layers#load('lang#html')

call SpaceVim#layers#load('lang#idris')

call SpaceVim#layers#load('lang#io')

call SpaceVim#layers#load('lang#ipynp')

call SpaceVim#layers#load('lang#java')

call SpaceVim#layers#load('lang#javascript')

call SpaceVim#layers#load('lang#json')

call SpaceVim#layers#load('lang#jsonnet')

call SpaceVim#layers#load('lang#julia')

call SpaceVim#layers#load('lang#kotlin')

call SpaceVim#layers#load('lang#lisp')

call SpaceVim#layers#load('lang#livescript')

call SpaceVim#layers#load('lang#lua')

call SpaceVim#layers#load('lang#markdown')

call SpaceVim#layers#load('lang#nim')

call SpaceVim#layers#load('lang#nix')

call SpaceVim#layers#load('lang#ocaml')

call SpaceVim#layers#load('lang#org')

call SpaceVim#layers#load('lang#packt')

call SpaceVim#layers#load('lang#pascal')

call SpaceVim#layers#load('lang#perl')

call SpaceVim#layers#load('lang#php')

call SpaceVim#layers#load('lang#plantuml')

call SpaceVim#layers#load('lang#pony')

call SpaceVim#layers#load('lang#powershell')

call SpaceVim#layers#load('lang#processing')

call SpaceVim#layers#load('lang#prolog')

call SpaceVim#layers#load('lang#python')

call SpaceVim#layers#load('lang#r')

call SpaceVim#layers#load('lang#racket')

call SpaceVim#layers#load('lang#reason')

call SpaceVim#layers#load('lang#red')

call SpaceVim#layers#load('lang#rescript')

call SpaceVim#layers#load('lang#ring')

call SpaceVim#layers#load('lang#rst')

call SpaceVim#layers#load('lang#ruby')

call SpaceVim#layers#load('lang#rust')

call SpaceVim#layers#load('lang#scheme')

call SpaceVim#layers#load('lang#swift')

call SpaceVim#layers#load('lang#teal')

call SpaceVim#layers#load('lang#toml')

call SpaceVim#layers#load('lang#typescript')

call SpaceVim#layers#load('lang#v')

call SpaceVim#layers#load('lang#vim')

call SpaceVim#layers#load('lang#vue')

call SpaceVim#layers#load('lang#xml')

call SpaceVim#layers#load('lang#zig')

call SpaceVim#layers#load('lsp')

call SpaceVim#layers#load('mail')

call SpaceVim#layers#load('shell')

call SpaceVim#layers#load('ssh')

call SpaceVim#layers#load('sudo')

call SpaceVim#layers#load('test')

call SpaceVim#layers#load('treesitter')

call SpaceVim#layers#load('tools')

call SpaceVim#layers#load('tools#dash')

call SpaceVim#layers#load('tools#mpv')

call SpaceVim#layers#load('tools#screensaver')

call SpaceVim#layers#load('tools#zeal')

call SpaceVim#layers#load('VersionControl')

call SpaceVim#layers#load('zettelkasten')
