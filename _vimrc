""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Common settings
" let mapleader=","        " The default map leader is \
" let g:mapleader=","
set noerrorbells         " Disable error sound
set novisualbell
set vb t_vb=
set timeoutlen=1000      " timeoutlen is used for mapping delays
set ttimeoutlen=0        " ttimeoutlen is used for code delays(eg. press ESC from command mode)

execute pathogen#infect()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI settings
set scrolloff=7          " Set 7 lines to the cursor when moving vertically using j/k(use zz to center the current line)
set wildmenu             " Turn on the WiLd menu(when type tab in command mode the menu will show above it)
set ruler                " Always show current position
set nu
set cursorline           " Hight light current line
syntax enable            " Enable syntax highlighting
set background=dark      " Set solarized theme
colorscheme solarized
set lazyredraw           " Don't redraw while executing macros
" set cmdheight=1        " Height of the command bar
set guioptions-=r        " Disable scrollbars in GUI
set guioptions-=R
set guioptions-=l
set guioptions-=L
set laststatus=2         " Always show the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\/%L\ \ Column:\ %c
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
hi statusline guibg=red guifg=black
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search & Matching
set ignorecase           " Ignore case when searching
set smartcase            " WHen searching try to be smart about cases
set hlsearch             " Highlight search result(:nohlsearch or :noh to cancel highlight)
set incsearch            " Makes search act like search in modern browsers
set magic                " Turn magic mode on, when searching by regular expression
set showmatch            " Show matching brackets when cursor is over them
set mat=1                " How many tenths of a second to blink when matching brackets
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabs & Indent
set expandtab            " Use spaces instead of tabs
set smarttab             " Be smart when using tabs
set shiftwidth=4         " Tab = 4 spaces
set tabstop=4
set autoindent           " Indent options
set smartindent
set linebreak            " Wrap line and don't break a word
set wrap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Environment
set history=500          " Set how many lines of history VIM has to remember
filetype plugin on       " Enable file type plugin (:set filetype=c)
filetype indent on
set autoread             " Auto reload file when it's changed from the outside
set nobackup             " Turn backup off
set nowb
set noswapfile
setlocal spell           " Toggle spell checking on and off
set encoding=utf8        " Set utf8 as default encoding
set ffs=unix             " Use unix as the standard file type

" Support for opening GBK files
let &termencoding=&encoding
set fileencodings=utf-8,gbk

" Turn persistent undo on
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <space> <leader>
nnoremap , :

" Key mapping
nnoremap <F10> :source ~/.vimrc 

" Fast saving by press ,w
nnoremap <leader>w :w!<cr>

" :W sudo saves the file
command! W w !sudo tee % > /dev/null

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Moving current line up-down(http://vim.wikia.com/wiki/Moving_lines_up_or_down)
nnoremap <leader>j :m .+1<cr>==
nnoremap <leader>k :m .-2<cr>==
vnoremap <leader>j :m '>+1<cr>gv=gv
vnoremap <leader>k :m '<-2<cr>gv=gv

" Cancel highlight       
nnoremap <leader>d :noh<cr>

" Useful mappings for managing tabs
" use gt, gT, ngt(n is tab number) to switch tabs
nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tq :tabclose<cr>

" Open a new tab with the current buffer's path
noremap <leader>tt :tabedit <c-r>=expand("%:p:h")<cr>/<cr>

noremap <leader>sp :setlocal spell!<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Build & Programme
nnoremap <F5> :!%:p<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin key mapping
nnoremap <leader>l :Goyo<cr>

nnoremap <leader>f :MRU<cr>
nnoremap <leader>e :NERDTreeToggle<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin config
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Open NERDTree when open a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

