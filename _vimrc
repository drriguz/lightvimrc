set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" disable vi compate mode
set nocompatible
set nobackup

set autochdir

" common settings
set nu
set cursorline
set ruler

" syntax setting
syntax on
set autoindent
set smartindent

" search setting
set ignorecase smartcase
set incsearch
set hlsearch

" disable error bell
set noerrorbells
set noeb
set vb
set vb t_vb=

" enable match
set showmatch
set matchtime=1

set magic
set hidden

" enable folding
set foldenable
set foldmethod=syntax
set foldcolumn=0
set foldclose=all
set foldlevelstart=99

" set tab size
set tabstop=4
set softtabstop=4
set shiftwidth=4

" other settings
" colorscheme desert
set textwidth=100
set mouse=a


" auto completion
" pydiction :http://www.vim.org/scripts/script.php?script_id=850 
" taglist   :http://www.vim.org/scripts/script.php?script_id=273
" winmanager:http://www.vim.org/scripts/script.php?script_id=95
" pyflakes  :http://www.vim.org/scripts/script.php?script_id=2441
" ctags     :http://ctags.sourceforge.net/
"
"note:to use pyflakes ,vim shoule be compiled with +python

filetype plugin indent on
set completeopt=longest,menu
set wildmenu
let g:pydiction_location='d:/Lite/pydiction/complete-dict'

" tag list
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" winManager
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

" map keys
map <F5> :call CompileAndRun()<CR>
func! CompileAndRun()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! %<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! %<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!java %<"
	elseif &filetype == 'sh'
		:!%
	elseif &filetype == 'py'
		exec "!python %"
	elseif &filetype == 'lua'
		exec "lua %"
	endif
endfunc

map <F8> :call Rungdb()<CR>  
func! Rungdb()  
	exec "w"  
	exec "!g++ % -g -o %<"  
	exec "!gdb %<"  
endfunc  
