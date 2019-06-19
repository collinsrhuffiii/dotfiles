set spell spelllang=en_us
set undofile
set encoding=utf-8
set directory=~/.config/nvim/swp

if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

set nomodeline

" Stop word wrapping
set nowrap
  " Except on Markdown
  autocmd FileType markdown setlocal wrap

set ignorecase
set number
set conceallevel=1
set noerrorbells
set background=dark

set expandtab
set autoindent
set softtabstop=4
set shiftwidth=4
set tabstop=4

set scrolloff=1
set sidescrolloff=5

set history=1000

set mouse=r
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" leader space
let mapleader="\<SPACE>"

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Set arrow keys to resize
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

" navigate panes
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Allow using the repeat operator with a visual selection (!)
vnoremap . :normal .<CR>


" Space Space to open previous buffer
nmap <Leader><Leader> <c-^>

" Tab to switch to next buffer
nnoremap <Tab> :bnext!<CR>

" Shift tab to switch to previous buffer
nnoremap <S-Tab> :bprev!<CR><Paste>

autocmd BufEnter * lcd %:p:h

filetype plugin indent on

set undodir=~/.config/nvim/undodir

call plug#begin()
Plug 'Shougo/unite.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'Yggdroot/indentLine'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'mhinz/vim-grepper'
Plug 'w0rp/ale'
Plug 'justinmk/vim-sneak'
Plug 'wolfgangmehner/lua-support'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" Required for operations modifying multiple buffers like rename.
set hidden

 " === coc.nvim === "
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

nmap <silent> <M-j> <Plug>(coc-definition)
nmap <silent> <C-,> <Plug>(coc-references)
nn <silent> K :call CocActionAsync('doHover')<cr>

set updatetime=300
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

nn <silent><buffer> <C-l> :call CocLocations('ccls','$ccls/navigate',{'direction':'D'})<cr>
nn <silent><buffer> <C-k> :call CocLocations('ccls','$ccls/navigate',{'direction':'L'})<cr>
nn <silent><buffer> <C-j> :call CocLocations('ccls','$ccls/navigate',{'direction':'R'})<cr>
nn <silent><buffer> <C-h> :call CocLocations('ccls','$ccls/navigate',{'direction':'U'})<cr>

" bases
nn <silent> xb :call CocLocations('ccls','$ccls/inheritance')<cr>
" bases of up to 3 levels
nn <silent> xb :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
" derived
nn <silent> xd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
" derived of up to 3 levels
nn <silent> xD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

" caller
nn <silent> xc :call CocLocations('ccls','$ccls/call')<cr>
" callee
nn <silent> xC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

" $ccls/member
" member variables / variables in a namespace
nn <silent> xm :call CocLocations('ccls','$ccls/member')<cr>
" member functions / functions in a namespace
nn <silent> xf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
" nested classes / types in a namespace
nn <silent> xs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

nmap <silent> xt <Plug>(coc-type-definition)<cr>
nn <silent> xv :call CocLocations('ccls','$ccls/vars')<cr>
nn <silent> xV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>

nn xx x

" ===================== "

" fuzzy finder
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>t :CtrlP<CR>

" find in files
nnoremap <Leader>fp :Grepper<Space>-query<Space>

" sneaking
let g:sneak#s_next = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" Space ` to toggle file tree
map ` :VimFiler -explorer<CR>

"Space ~ to open file tree from current buffer's dir
map ~ :VimFilerCurrentDir -explorer -find<CR>

" airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2

" indentline
let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"

" palenight
set background=dark
colorscheme palenight

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Italics
let g:palenight_terminal_italics=1
