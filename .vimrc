""###[ vim-plug ]###############################################################
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    \ >/dev/null 2>&1
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'Shougo/ddc.vim'
Plug 'Shougo/pum.vim'
Plug 'Shougo/ddc-around'
Plug 'preservim/nerdtree'
Plug 'LumaKernel/ddc-file'
Plug 'Shougo/ddc-sorter_rank'
Plug 'ryanoasis/vim-devicons'
Plug 'Shougo/ddc-matcher_head'
Plug 'vim-airline/vim-airline'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/ddc-converter_remove_overlap'
call plug#end()

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let NERDTreeShowHidden=1

augroup TransparentBG
  autocmd!
  "" airline transparent
  autocmd Colorscheme * highlight Normal ctermbg=none
  autocmd Colorscheme * highlight NonText ctermbg=none
  autocmd Colorscheme * highlight LineNr ctermbg=none
  autocmd Colorscheme * highlight Folded ctermbg=none
  autocmd Colorscheme * highlight EndOfBuffer ctermbg=none
  "" Statement
  autocmd colorscheme * highlight clear Statement
  autocmd colorscheme * highlight Statement ctermfg=202
  "" Comment
  autocmd colorscheme * highlight Comment ctermbg=15
  autocmd colorscheme * highlight clear Comment
  "" Keyword
  autocmd colorscheme * highlight clear Keyword
  autocmd colorscheme * highlight Keyword ctermfg=202
  "" Conditional
  autocmd colorscheme * highlight clear Conditional
  autocmd colorscheme * highlight Conditional ctermfg=202
  "" CursorLine
  autocmd colorscheme * highlight clear CursorLine
  autocmd colorscheme * highlight CursorLine ctermfg=196
  autocmd colorscheme * highlight CursorLine ctermbg=208
augroup END

:command T NERDTree

""###[ config ]#################################################################
set nowritebackup                        
set nobackup                             
set virtualedit=block                    
set backspace=indent,eol,start           
set ambiwidth=single                     
set wildmenu                             

""###[ config(search) ]#########################################################
set ignorecase                           
set smartcase                            
set wrapscan                             
set incsearch                            
set hlsearch                             

""###[ config(editor) ]#########################################################
set t_Co=256                             
set background=dark                      
set noerrorbells                         
set shellslash                           
set showmatch matchtime=1                
set cinoptions+=:0                       
set cmdheight=2                          
set laststatus=2                         
set showcmd                              
set display=lastline                     
set list                                 
set listchars=tab:^\ ,trail:~            
set history=10000                        
hi Comment ctermfg=3                     
set expandtab                            
set shiftwidth=2                         
set softtabstop=2                        
set tabstop=2                            
set guioptions-=T                        
set guioptions+=a                        
set guioptions-=m                        
set guioptions+=R                        
set showmatch                            
set smartindent                          
set noswapfile                           
set nofoldenable                         
set title                                
set number                               
" set clipboard=unnamed,autoselect         
nnoremap <Esc><Esc> :nohlsearch<CR><ESC> 
syntax on                                
set nrformats=                           
set whichwrap=b,s,h,l,<,>,[,],~          
set mouse=a                              
set ttimeoutlen=50                       
set cursorline
" set cursorcolumn

""###[ auto reload .vimrc ]#####################################################
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

""###[ auto comment off ]#######################################################
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

""###[ html/xml auto close tag ]################################################
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

""###[ memorize the cursor of the edited part ]#################################
if has("autocmd")
  augroup redhat
    " In text files, alwaycの2回押しでハイライト消去[B limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

colorscheme gruvbox-material
