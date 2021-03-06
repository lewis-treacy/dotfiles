" ============================================ Plugins =============================================
call plug#begin('~/.local/share/nvim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'chrisbra/csv.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'honza/vim-snippets'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'majutsushi/tagbar'
  Plug 'sbdchd/neoformat'
  Plug 'scrooloose/syntastic'
  Plug 'sirver/ultisnips'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()


" ============================================ General =============================================
set history=1000

filetype plugin on
filetype indent on

set autoread
let mapleader = ","


" ========================================= User interface =========================================
set so=7

set number relativenumber
set mouse=a
set showcmd
set clipboard=unnamedplus
set nowrap
set linebreak

set list
set listchars=eol:¬,trail:~,space:·,tab:>-

set ruler
set colorcolumn=80
set cmdheight=2
set backspace=eol,start,indent
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set laststatus=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set foldcolumn=1
set updatetime=250


" ======================================= Colours and Fonts ========================================
syntax enable
set background=dark

set t_Co=256

set encoding=utf8
highlight SpecialKey ctermfg=darkgrey
highlight NonText ctermfg=darkgrey
highlight MatchParen cterm=none ctermbg=grey ctermfg=darkblue


" ====================================== Text, Tab and Indent ======================================
set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

set splitright
set splitbelow


" ========================================== Visual mode ===========================================
" * or # will search the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<cr>/<C-R>=@/<cr><cr>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<cr>/<C-R>=@/<cr><cr>


" ============================ Moving around, tabs, windows and buffers ============================
map j gj
map k gk

map <space>   /
map <c-space> ?

map <silent> <leader><cr> :noh<cr>

map <C-h>  <C-w>h
map <C-j>  <C-w>j
map <C-k>  <C-w>k
map <C-l>  <C-w>l
map <C-M>h <C-w>H
map <C-M>j <C-w>J
map <C-M>k <C-w>K
map <C-M>l <C-w>L

map <leader>bd :Bclose<cr>:tabclose<cr>gT
map <leader>ba :bufdo bd<cr>
map <leader>l  :bnext<cr>
map <leader>h  :bprevious<cr>

map <leader>nt        :tabnew<cr>
map <leader>ot        :tabonly<cr>
map <leader>ct        :tabclose<cr>
map <leader>mt        :tabmove<cr>
map <leader>t<leader> :tabnext<cr>

nnoremap <C-g> :Rg<Cr>

let g:lasttab = 1
nmap <leader>lt :exe "tabn ".g:lasttab<cr>
autocmd TabLeave * let g:lasttab = tabpagenr()

map <leader>et :tabedit <c-r>=expand("%:p:h")<cr>/
map <leader>cd :cd %:p:h<cr>:pwd<cr>

try
  set switchbuf=useopen,uestab,newtab
  set stal=2
catch
endtry

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

command F FZF


" ========================================= Disable Arrows =========================================
map  <up>    <nop>
map  <down>  <nop>
map  <left>  <nop>
map  <right> <nop>
imap <up>    <nop>
imap <down>  <nop>
imap <left>  <nop>
imap <right> <nop>


" ======================================== Editing mappings ========================================
map B ^
map E $
map ; :

imap <S-Tab> <C-D>
command! Sw w !sudo tee % > /dev/null

nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

nmap <leader>ev :vsp $MYVIMRC<cr>
nmap <leader>sv :so $MYVIMRC<cr>
nmap <leader>tn :call ToggleNumbers()<cr>
nmap <leader>tl :call ToggleList()<cr>
nmap <leader>tt :TagbarToggle<cr>

map <leader>ss :setlocal spell!<cr>

map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)


" ======================================= Language specific ========================================
autocmd BufWritePre *.vim,*.txt,*.js,*.py,*.sh,*.tex,*rc :call CleanExtraSpaces()

autocmd FileType vim set colorcolumn=100
autocmd FileType tex,markdown set colorcolumn=100
autocmd BufEnter *.py set tabstop=4 shiftwidth=4
autocmd BufEnter *.go set tabstop=4 shiftwidth=4 noexpandtab

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

fun! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('\')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun


" ============================================= Airline ============================================
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'


" ============================================ Syntastic ===========================================
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

let g:syntastic_go_checkers = ['go', 'gofmt']
let g:syntastic_tex_checkers = ['lacheck', 'text/language_check']


" ============================================== CtrlP =============================================
let g:ctrlp_show_hidden = 1


" ============================================== Tagbar ============================================
nmap <F8> :TagbarToggle<cr>

let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }


" ============================================ UltiSnips ===========================================
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

" ============================================ EasyAlign ===========================================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" =============================================== FZF ==============================================
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
