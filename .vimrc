source ~/vimfiles/.vimcommon "Load common settings

set nocompatible    "run in vim mode
set smartindent     "return ending brackets to proper locations
set showmatch       "show matching brackets
set ruler           "show cursor position at all times
set colorcolumn=120 "mark 120 character column

" Clear highlighting on escape in normal mode
nnoremap <esc>^[ <esc>^[

" Add relative jumps that are longer than 1 to jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

"make :W and :Q work
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang> <args>
command! -bang Q quit<bang>

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
Plug 'easymotion/vim-easymotion'
Plug 'peitalin/vim-jsx-typescript'
call plug#end()


"ctrl-K opens nerdtree
map <C-k> :NERDTreeToggle<CR>

"open nerdtree when vim opens a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) 
            \&& !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"theme
autocmd vimenter * colorscheme gruvbox "theme
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
" Easymotion uses smartcase
let g:EasyMotion_smartcase = 1

" <Leader>f{char} to move to {char}
 map  <Leader>f <Plug>(easymotion-bd-f)
 nmap <Leader>f <Plug>(easymotion-overwin-f)
"
" " s{char} to move to {char}
 nmap s <Plug>(easymotion-overwin-f)
"
" " Move to line
 map <Leader>L <Plug>(easymotion-bd-jk)
 nmap <Leader>L <Plug>(easymotion-overwin-line)
"
" " Move to word
 map  <Leader>w <Plug>(easymotion-bd-w)
 nmap <Leader>w <Plug>(easymotion-overwin-w)
