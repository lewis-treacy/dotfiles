call plug#begin()

"Plugins{
    Plug 'neovimhaskell/haskell-vim'

    Plug 'kien/ctrlp.vim'
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-surround'

    Plug 'chriskempson/base16-vim'
"}

call plug#end()

let mapleader="\<SPACE>"

set showcmd
set showmatch
set ruler
set number
set formatoptions+=o
set textwidth=0
set expandtab
set tabstop=4
set shiftwidth=4

set noerrorbells
set esckeys
set linespace=0
set nojoinspaces

set splitbelow
set splitright

if !&scrolloff
    set scrolloff=3
endif
if !&sidescrolloff
    set sidescrolloff=5
endif
set display+=lastline
set nostartofline

if &listchars ==# "eol:$"
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set hlsearch
set ignorecase
set smartcase
set incsearch
set gdefault
set magic

set clipboard=unnamedplus
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

set rnu
function NumToggle()
    if(&relativenumber == 1)
        set nornu
        set number
    else
        set rnu
    endif
endfunction

function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

nnoremap <leader>r :call NumToggle()<CR>
autocmd InsertEnter * :call NumToggle()
autocmd InsertLeave * :call NumToggle()

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
inoremap  <Up>     <nop>
inoremap  <Down>   <nop>
inoremap  <Left>   <nop>
inoremap  <Right>  <nop>
noremap   <Up>     <nop>
noremap   <Down>   <nop>
noremap   <Left>   <nop>
noremap   <Right>  <nop>
nnoremap B ^
nnoremap E $

nnoremap ; :
nnoremap Q @q
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>v `[v`]
autocmd FileType python nnoremap <leader>y :0,$!yapf<CR>
map <leader>k :NERDTreeToggle<CR>

nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>
nnoremap <leader>s :mksession<cr>

map <A-h> gt
map <A-l> gT

nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-A-H> <C-W>H
nnoremap <C-A-J> <C-W>J
nnoremap <C-A-K> <C-W>K
nnoremap <C-A-L> <C-W>L

inoremap <S-Tab> <C-D>

autocmd FileType python set colorcolumn=80
autocmd FileType haskell set colorcolumn=80
autocmd FileType haskell set tabstop=2 | set shiftwidth=2

let base16colorspace=256
set bg=dark
colorscheme base16-google-dark

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'base16'

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
