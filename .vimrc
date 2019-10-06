set nocompatible   " Disable vi compatibilty
set encoding=utf-8 " Use UTF-8
filetype off       " Disable filetype
syntax on          " Turn on syntax highlighting
set showmatch      " Show matching brackets
set ignorecase     " Do case insensitive matching
set incsearch      " Show partial matches for a search phrase
set number         " Show numbers
set relativenumber " Show relative numbers
set undolevels=999 " Lots of these 
set hls            " Highlight Search
set tabstop=4      " Tab size
set shiftwidth=4   " Indentation size
set softtabstop=4  " Tabs/Spaces interop
set expandtab      " Expands tab to spaces
set nomodeline     " Disable as a security precaution
set mouse=a        " Enable mouse mode
set termguicolors  " Enable true colors
set wildmenu       " Enable wildmenu
set conceallevel=0 " Disable concealing

" Vundle Init
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'w0rp/ale'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'godlygeek/tabular'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

" Vundle Ends
call vundle#end()
filetype plugin indent on

" Keybindings
inoremap jj <Esc>
let mapleader = ','
let g:user_emmet_leader_key=','
map <Leader>e : NERDTreeToggle<CR>

" Copy Paste from X11 Clipboard
vmap <Leader>yy :!xclip -f -sel clip<CR>
map <Leader>pp mz:-1r !xclip -o -sel clip<CR>`z

" Drag Visual selections
vnoremap K xkP`[V`]
vnoremap U xp`[V`]
vnoremap L >gv
vnoremap H <gv

" Airline
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = "\uE0B0"
let g:airline_right_sep = "\uE0B2"

" Always use terminal background
autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE

" One Dark
let g:onedark_color_overrides = {
\ "comment_grey": {"gui": "#69747C","cterm": "245", "cterm16": "8"},
\ "gutter_fg_grey": { "gui": "#69747C", "cterm": "245", "cterm16": "8"}
\}
if !exists('$TMUX')
    let g:onedark_terminal_italics = 1
endif
colorscheme onedark

" IndentLine
let g:indentLine_char =''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 1
autocmd FileType markdown let g:indentLine_enabled=0

" Highlight non whitespace characters
set listchars=tab:,nbsp:_,trail:
set list

" NERDTree
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>":"\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>":"\<s-tab>
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Have Vim jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\""
endif

