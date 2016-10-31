 " ==================== Plugins =====================
call plug#begin()

    Plug 'neovimhaskell/haskell-vim'

    Plug 'kien/ctrlp.vim'
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/syntastic'

    Plug 'chriskempson/base16-vim'

call plug#end()

" ================= General Config =================
set number
set backspace=indent,eol,start
set history=1000
set showcmd
set gcr=a:blinkon0
set visualbell
set autoread
set laststatus=2
set clipboard=unnamedplus
set noshowmode
set colorcolumn=80
set splitright
set splitbelow
set rnu

set hidden

let mapleader="\<SPACE>"

" ==================== Colours =====================
syntax on
let base16colorspace=256
colorscheme base16-google-dark

set listchars=eol:¬,trail:~,space:·
set list
highlight SpecialKey ctermfg=darkgrey
highlight NonText ctermfg=darkgrey
highlight MatchParen cterm=none ctermbg=grey ctermfg=darkblue

" ================== Indentation ===================
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype indent on
filetype plugin on

set nowrap
set linebreak

" =================== Scrolling ====================
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" ===================== Search =====================
set incsearch
set hlsearch
set ignorecase
set smartcase

" =============== Disabled Shortcuts ===============
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

" ================= Line Shortcuts =================
nnoremap B ^
nnoremap E $
nnoremap ; :
nnoremap Q @q

inoremap <S-Tab> <C-D>

" ================ Leader Shortcuts ================
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>/ :nohlsearch<CR>
nnoremap <leader>k :NERDTreeToggle<CR>
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>
nnoremap <leader>r :call ToggleNumber()<CR>
nnoremap <leader>l :call ToggleList()<CR>

" ============== Navigation Shortcuts ==============
map <A-h> gt
map <A-l> gT

nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-A-H> <C-W><S-H>
nnoremap <C-A-J> <C-W><S-J>
nnoremap <C-A-K> <C-W><S-K>
nnoremap <C-A-L> <C-W><S-L>

" =========== Language Specific Settings ===========
autocmd FileType haskell set tabstop=2 | set shiftwidth=2

" ================ Custom Functions ================
" Toggles between number and realtive number when mode is changed
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
autocmd InsertEnter * :call ToggleNumber()
autocmd InsertLeave * :call ToggleNumber()

function! ToggleList()
    if(&list == 1)
       set nolist
    else
       set list
    endif
endfunc

" =================== Syntastic ====================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_haskell_checkers = ['hdevtools']

" ==================== Airline =====================
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'base16'

" ===================== Ctrl-P =====================
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
