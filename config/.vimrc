"  Options
set nocompatible   " Disable vi compatibilty
set encoding=utf-8 " Use UTF-8
set showmatch      " Show matching brackets
set ignorecase     " Do case insensitive matching
set incsearch      " Show partial matches for a search phrase
set number         " Show numbers
set relativenumber " Show relative numbers
set nohlsearch     " clear highlights after search
set tabstop=4      " Tab size
set shiftwidth=4   " Indentation size
set softtabstop=4  " Tabs/Spaces interop
set expandtab      " Expands tab to spaces
set nomodeline     " Disable as a security precaution
set mouse=a        " Enable mouse mode
set hlsearch       " Enable search highlight
set wildmenu       " Enable wildmenu
set path+=**       " Search recursively with :find
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
set formatoptions+=j " Delete comment character when joining
set listchars=tab:,nbsp:_,trail:,extends:>,precedes:<
set list           " Highlight non whitespace characters
set nrformats-=octal " 007 != 010
set sessionoptions-=options
set viewoptions-=option
set cursorline     " Highlight current line
set exrc           " Use vimrc from local dir
set hidden         " Enable switching with modified buffers
set undolevels=999 " Lots of these
set undofile       " Enable persistent undos across files
setlocal spell spelllang=en "Set spell check language to en
setlocal spell! " Disable spellchecking by default
syntax enable      " Turn on syntax highlighting

" Have Vim jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\""
endif

" Remove trailing whitespace on write
if has("autocmd")
    autocmd BufWritePre * %s/\s\+$//e
endif

" Load files using fzf
function! FZF() abort
    let l:tempname = tempname()
    execute 'silent !fzf --multi ' . '| awk ''{ print $1":1:0" }'' > ' . fnameescape(l:tempname)
    try
        execute 'cfile ' . l:tempname
        redraw!
    finally
        call delete(l:tempname)
    endtry
endfunction

command! -nargs=* Files call FZF()

" Keybindings
let mapleader = ' '
inoremap jj <Esc>
nmap <leader>e :Lexplore<CR>
nmap <leader>f :Files<cr>
nmap <leader>q :q<CR>
nmap <leader>Q :qa!<CR>
nmap <leader>r :source ~/.vimrc<CR>
nmap <leader>s :setlocal spell!<CR>
nmap <leader>S :nohlsearch<CR>
nmap <leader>t :term<CR>
nmap <leader>w :w<CR>
nmap <leader>W :wq<CR>
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

" tmux true color fix
if (has("termguicolors"))
    set termguicolors
endif

" Always use terminal background
autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight! Terminal ctermbg=NONE guibg=NONE

colorscheme slate
