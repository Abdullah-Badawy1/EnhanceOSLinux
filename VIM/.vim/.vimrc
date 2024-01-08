
" Enable syntax highlighting for better readability
syntax on

"Spaces
set autoindent
set tabstop=4       " Set the number of spaces in a tab
set shiftwidth=4    " Set the number of spaces for indentation
set expandtab       " Convert tabs to spaces
set smartindent     " Enable smart auto-indenting

" Display line numbers for easy navigation
set number          " Show line numbers on the left

" Enable mouse support in all modes for ease of use
set mouse=a

" Improve search functionality
set hlsearch        " Highlight search results
set incsearch       " Show incremental search results as you type

" Enable file type detection and apply appropriate settings and plugins
filetype plugin on
filetype indent on

" Show matching brackets, useful for coding
set showmatch

" Customize the status line for detailed information at a glance
set statusline=%F%m%r%h%w\ [%Y]\ [%{&ff}]\ [%{&fileencoding}]\ [%{&fileformat}]\ [0x%B]\ [Pos:%l,%v]\ [%p%%]\ [Len:%L]
set laststatus=2    " Always display the status line
" theme"
set termguicolors
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
set background=dark
set laststatus=2
set cmdheight=2

"Cursorline highlight
set cursorline
set cursorcolumn
highlight Cursorline guibg=#2b2b2b
highlight Cursorlolumn guibg=#2b2b2b
set hlsearch

"Clipboard
set clipboard=unnamedplus


" Increase command history length for convenience
set history=300

" Disable creation of backup files to avoid clutter
set nobackup
set nowritebackup
set noswapfile

" Automatically read files changed outside of Vim
set autoread

" Set file encoding to UTF-8 for wide compatibility
set encoding=utf-8

" Configure code folding for better code management
set foldmethod=syntax   " Use syntax-based folding
set foldlevelstart=10   " Start with most folds open
set nofoldenable        " Don't automatically fold new files
"Spliting
set splitright
set splitbelow
let python_highlight_all = 1
" Optimize Vim's responsiveness
set updatetime=300

" Display incomplete commands for better feedback
set showcmd

" Always show the cursor position
set ruler


" Configure search behavior for flexibility
set ignorecase      " Case insensitive search...
set smartcase       " ...unless search query contains uppercase letters

" Remove tilde (~) characters on empty lines for a cleaner look
set nolist          " Disable special characters for end-of-line, etc.
set fillchars+=eob:\ " Use a space for end-of-buffer character
" Plugins Section
call plug#begin('~/.vim/plugged')

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'Yggdroot/indentLine'
  Plug 'itchyny/lightline.vim'

" NERDTree for file navigation
Plug 'preservim/nerdtree'

" Vim-Airline for enhanced status line
Plug 'vim-airline/vim-airline'

" YouCompleteMe for auto-completion

" Fugitive for Git integration
Plug 'tpope/vim-fugitive'

" Syntastic for syntax checking
Plug 'vim-syntastic/syntastic'

" Vim-Polyglot for language pack
Plug 'sheerun/vim-polyglot'

" Vim-GitGutter for Git diff in the gutter
Plug 'airblade/vim-gitgutter'

" Vim-Surround for easy surround editing
Plug 'tpope/vim-surround'

" Vim-Commentary for easy code commenting
Plug 'tpope/vim-commentary'

call plug#end()
"NerdTree
"autocmd VimEnter * NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:indentLine_char='|'

"Key maps
nnoremap <C-a> ggVG
nnoremap <C-q> :q! <LF>
nnoremap <C-n> :NERDTree<CR>
"splits navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
