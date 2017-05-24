" ============================================ General =============================================
set history=1000

filetype plugin on
filetype indent on

set autoread

let mapleader = ","

nmap <leader>w :w!<cr>

command! WW w !sudo tee % > /dev/null


" ======================================= VIM user interface =======================================
set so=7

"set wildmenu
"set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/DS_Store

set number relativenumber
set showcmd
set clipboard=unnamedplus
set nowrap
set linebreak

set list
set listchars=eol:¬,trail:~,space:·

set ruler
set colorcolumn=80
set cmdheight=2
"set hid
set backspace=eol,start,indent
"set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set foldcolumn=1


" ======================================= Colours and Fonts ========================================
syntax enable

set background=dark
set encoding=utf8
highlight SpecialKey ctermfg=darkgrey
highlight NonText ctermfg=darkgrey
highlight MatchParen cterm=none ctermbg=grey ctermfg=darkblue


" ==================================== Files, Backups and Undo =====================================
set nobackup
set nowb
set noswapfile


" ====================================== Text, Tab and Indent ======================================
set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
"set lbr
"set tw=100

set splitright
set splitbelow


" ========================================== Visual mode ===========================================
" * or # will search the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<cr>/<C-R>=@/<cr><cr>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<cr>/<C-R>=@/<cr><cr>


" ============================ Moving around, tabs, windows and buffers ============================
map j gj
map k gk

map <space> /
map <c-space> ?

map <silent> <leader><cr> :noh<cr>

map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

map <leader>bd :Bclose<cr>:tabclose<cr>gT
map <leader>ba :bufdo bd<cr>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

map <leader>tn :tabnew<cr>
map <leader>to :taonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>t<leader> :tabnext<cr>

let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<cr>
autocmd TabLeave * let g:lasttab = tabpagenr()

map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>cd :cd %:p:h<cr>:pwd<cr>

try
  set switchbuf=useopen,uestab,newtab
  set stal=2
catch
endtry

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ========================================== Status line ===========================================
set laststatus=2
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:%l\ \ Column:%c


" ========================================= Disable Arrows =========================================
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>


" ======================================== Editing mappings ========================================
map B ^
map E $
map ; :

imap <S-Tab> <C-D>

nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

nmap <leader>ev :vsp $MYVIMRC<cr>
nmap <leader>sv :so $MYVIMRC<cr>
nma <leader>tn :call ToggleNumbers()<cr>
nmap <leader>tl :call ToggleList()<cr>

fun! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('\')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun

autocmd BufWritePre *.vim,*.txt,*.js,*.py,*.sh,*.c :call CleanExtraSpaces()


" ========================================= Spell Checking =========================================
map <leader>ss :setlocal spell!<cr>

map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


" ======================================= Language specific ========================================
autocmd FileType vim set colorcolumn=100
autocmd FileType tex set colorcolumn=""
autocmd FileType tex set wrap
autocmd FileType python set tabstop=4 shiftwidt=4

autocmd BufWritePost *.tex silent !pdflatex %


" ======================================== Helper Functions ========================================
fun! ToggleNumbers()
  if (&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfun
autocmd InsertEnter * :call ToggleNumbers()
autocmd InsertLeave * :call ToggleNumbers()

fun! ToggleList()
  if (&list == 1)
    set nolist
  else
    set list
  endif
endfun
