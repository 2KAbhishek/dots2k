"  Options
set nocompatible   " Disable vi compatibilty
set encoding=utf-8 " Use UTF-8
syntax enable      " Turn on syntax highlighting
set showmatch      " Show matching brackets
set ignorecase     " Do case insensitive matching
set incsearch      " Show partial matches for a search phrase
set number         " Show numbers
set relativenumber " Show relative numbers
set undolevels=999 " Lots of these
set nohlsearch     " clear highlights after search
set tabstop=4      " Tab size
set shiftwidth=4   " Indentation size
set softtabstop=4  " Tabs/Spaces interop
set expandtab      " Expands tab to spaces
set nomodeline     " Disable as a security precaution
set mouse=a        " Enable mouse mode
set wildmenu       " Enable wildmenu
set splitbelow     " Natural splits
set splitright
set autoindent     " Enable autoindent
set complete-=i    " Better completion
set smarttab       " Better tabs
set ttimeout       " Set timeout
set ttimeoutlen=100
set synmaxcol=500  " Syntax limit
set laststatus=2   " Always show status line
set ruler          " Show cursor position
set scrolloff=8    " Scroll offset
set sidescrolloff=5
set autoread       " Reload files on change
set tabpagemax=50  " More tabs
set history=1000   " More history
set viminfo^=!     " Better viminfo
set backspace=indent,eol,start " Delete everything
set formatoptions+=j " Delete comment character when joining commented lines
set listchars=tab:,nbsp:_,trail:,extends:>,precedes:<
set list           " Highlight non whitespace characters
set nrformats-=octal " 007 != 010
set sessionoptions-=options
set viewoptions-=option
set cursorline     " Highlight current line
set exrc           " Use vimrc from local dir
set hidden         " Enable switching with modified buffers
set undofile       " Enable persistent undos across file open and closeasa
setlocal spell spelllang=en "Set spell check language to en
setlocal spell! " Disable spellchecking by default

" tmux true color fix
if (has("termguicolors"))
    set termguicolors
endif

" Always use terminal background
autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight! Terminal ctermbg=NONE guibg=NONE

" Have Vim jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\""
endif

" Remove trailing whitespace on write
if has("autocmd")
    autocmd BufWritePre * %s/\s\+$//e
endif

" Keybindings
inoremap jj <Esc>
let mapleader = ' '
inoremap <C-W> <C-G>u<C-W>
inoremap <C-U> <C-G>u<C-U>
nmap <leader>Q :qa!<CR>
nmap <leader>q :q<CR>
nmap <leader>w :w<CR>
nmap <leader>W :wq<CR>
nmap <leader>r :source ~/.vimrc<CR>
nmap <leader>s :setlocal spell!<CR>
nmap <leader>g :Git<CR>
nmap <leader>t :term<CR>
nmap <leader>f :FZF<CR>
nmap H :bprevious<CR>
nmap L :bnext<CR>

" Copy Paste from X11 Clipboard
vmap <Leader>yy :!xclip -f -sel clip<CR>
map <Leader>pp mz:-1r !xclip -o -sel clip<CR>`z

" Drag Visual selections
vnoremap K xkP`[V`]
vnoremap J xp`[V`]
vnoremap L >gv
vnoremap H <gv

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()
filetype plugin indent on

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = "\uE0B0"
let g:airline_right_sep = "\uE0B2"

" NERDTree
map <Leader>e : NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" One Dark
let g:onedark_color_overrides = {
\ "comment_grey": {"gui": "#69747C","cterm": "245", "cterm16": "8"},
\ "gutter_fg_grey": { "gui": "#69747C", "cterm": "245", "cterm16": "8"}
\}
if !exists('$TMUX')
    let g:onedark_terminal_italics = 1
endif
colorscheme onedark

