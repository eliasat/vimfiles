set nocompatible    "run in vim mode
set nowrap          "don't wrap lines
set expandtab       "expand tabs into spaces
set autoindent      "auto-indent new lines
set smartindent     "return ending brackets to proper locations
set softtabstop=4   "indentation level of soft-tabs
set tabstop=4       "tabs are 4 space long
set shiftwidth=4    "how many columns to re-indent with << and >>
set showmatch       "show matching brackets
set ruler           "show cursor position at all times
set number relativenumber " toggle hybrid line numbers
set smartcase       "if search contains capital letters, search becomes case sensitive
set incsearch       "incremental search
set colorcolumn=120 "mark 120 character column
syntax on           "turn on syntax highlighting
set bs=2 "fix backspace on some consoles

 "ctrl-K opens nerdtree
map <C-k> :NERDTreeToggle<CR>

autocmd vimenter * colorscheme gruvbox "theme

"" Backup, Swap and Undo
set undofile " Persistent Undo
if has("win32")
    set directory=$HOME\vimfiles\swap,$TEMP
    set backupdir=$HOME\vimfiles\backup,$TEMP
    set undodir=$HOME\vimfiles\undo,$TEMP
else
    set directory=~/.vim/swap,/tmp
    set backupdir=~/.vim/backup,/tmp
    set undodir=~/.vim/undo,/tmp
endif

"open nerdtree when vim opens a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) 
            \&& !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"Plug extensions
if has("win32")
    call plug#begin('~\AppData\Local\nvim-data\site\autoload\')
else
    call plug#begin('~/.config/nvim/plugged/')
endif
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
call plug#end()
colorscheme gruvbox
set background=dark

" coc config
let g:coc_global_extensions = [
            \'coc-snippets',
            \'coc-prettier',
            \'coc-yaml',
            \'coc-tsserver',
            \'coc-json',
            \'coc-html',
            \'coc-css',
            \'coc-omnisharp'
            \]
if executable('rg')
    let g:rg_derive_root='true'
endif

