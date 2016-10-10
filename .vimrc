" >>>>>>>>> USABILITY CONFIGURATION <<<<<<<<<

" don't make vim comptible with vi
set nocompatible

" turn on syntax highlighting
syntax on 

" show line numbers
set number

" make vim try to detect file types and load plugins for them
filetype on
filetype plugin on
filetype indent on

" reload files changed outside vim 
set autoread

" encoding is utf 8
set encoding=utf-8
set fileencoding=utf-8

" enable matchit plugin
runtime macros/matchit.vim

" don't upload buffers when they are abandoned
set hidden

" set unix line endings
set fileformat=unix

" when reading files try unix line endings then dos, also use unix for new buffers
set fileformats=unix,dos

" save up to 100 marks, enable capital marks
set viminfo='100,f1

" screen will not be redrawn while running macros, registers or other non-typed comments
set lazyredraw
set ttyfast

" >>>>>>>>> CUSTOMIZATION <<<<<<<<<

" Mapping keys to fuzzy finder
nmap <leader>f :tabnew \| FufFileWithCurrentBufferDir:<CR>
nmap <leader>b :FufBuffer<CR>
nmap <leader>t :FufTaggedFile<CR>
nmap <leader>o :fuf_keyOpenVsplit

" Close NERDTree when all other it's the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree when no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" set , as mapleader
let mapleader = ','

" when pasting over SSH it's a pain to type :set paste and :set nopaste
" just map it to <f9>
set pastetoggle=<f9>

" Auto-indent pastes according to surrounding code.
nnoremap <leader>p p
nnoremap <leader>P P
nnoremap p p'[v`]=`]
nnoremap P P'[v`]=`]

" map <leader>q and <leader>w to buffer prev/next buffer
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

" windows like clipboard
" yank to and paste from the clipboard without prepending "* to commands
let &clipboard = has('unnamedplus') ? 'unnamedplus' : 'unnamed'
" map c-x and c-v to work as they do in windows, only in insert mode
vm <c-x> "+x
vm <c-c> "+y
cno <c-v> <c-r>+
exe 'ino <script> <C-V>' paste#paste_cmd['i']

" save with ctrl+s
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" Allow Tab and Shift+Tab to
" tab  selection in visual mode
vmap <Tab> >gv
vmap <S-Tab> <gv 

" set swapfiles to be in /tmp directory
" set swapfile
" set dir=~/.tmp

" search settings
set incsearch        " find the next match as we type the search
set hlsearch         " hilight searches by default

" use ESC to remove search higlight
nnoremap <esc> :noh<return><esc>

" keep the cursor visible within 3 lines when scrolling
set scrolloff=3

" suggestion for normal mode commands
set wildmode=list:longest:full,full

" use <C-Space> for Vim's keyword autocomplete
"  ...in the terminal
inoremap <Nul> <C-n>
"  ...and in gui mode
inoremap <C-Space> <C-n>

" On file types...
"   .md files are markdown files
autocmd BufNewFile,BufRead *.md setlocal ft=markdown

" select all mapping, gg=go to top, V=viusal mode, G=go to bottom
noremap <leader>a ggVG

" Set tab to 4 spaces wide
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

" >>>>>>>>> PLUGIN CONFIG <<<<<<<<<

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'

" We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'itchyny/lightline.vim'   
Plugin 'tpope/vim-surround'    
Plugin 'Shutnik/jshint2.vim'        
Plugin 'mattn/emmet-vim'            
Plugin 'kchmck/vim-coffee-script'   
Plugin 'groenewege/vim-less'        
Plugin 'skammer/vim-css-color'      
Plugin 'hail2u/vim-css3-syntax'     
Plugin 'digitaltoad/vim-jade'     


" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Buffergator'

" end plugin definition
call vundle#end()            " required for vundle

filetype plugin indent on

" Start NERDTree on start-up and focus active window
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" map FuzzyFinder
noremap <leader>b :FufBuffer<cr>
noremap <leader>f :FufFile<cr>

" run JSHint when a file with .js extension is saved
" this requires the jsHint2 plugin
autocmd BufWritePost *.js silent :JSHint
