" First things first! ------------------ {{{
" Change leader key to space
let mapleader = "\<Space>"

" Setting up vim-plug (plugin manager)
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
call plug#end()
" }}}

" Mappings ----------------- {{{
" Edit .vimrc and apply
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Buffer switching mappings
nnoremap gn :bn<CR>
nnoremap gp :bp<CR>

" Map <C-t> to :tabnew<CR>
nnoremap <C-t> :tabnew<CR>

" Map to reload tabs
nnoremap <C-L> :bufdo e<CR>

" Setting up tagbar
nnoremap <F8> :TagbarToggle<CR>

" Semicolon map
nnoremap <leader>; :normal! mqA;<ESC>`q
" }}}

" Maps for Obsession ------------------ {{{
nnoremap <leader>oo :Obsess<CR>
nnoremap <leader>oe :Obsess!<CR>
" }}}

" neosnippet config ---------------------- {{{
imap <C-k>  <Plug>(neosnippet_expand_or_jump)
smap <C-k>  <Plug>(neosnippet_expand_or_jump)
xmap <C-k>  <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
   set conceallevel=2 concealcursor=niv
endif
" }}}

" Activate neocomplete --------------------- {{{
let g:neocomplete#enable_at_startup = 1
" }}}

" Map ctrl-[jkhl] to switch panes --------------------- {{{
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" }}}

" Ctrlp setting ----------------- {{{
let g:ctrlp_map= '<c-p>'
let g:ctrlp_cmd= 'CtrlP'
" }}}

" Vimscript file setting ---------------------- {{{
augroup filetype_vim
   autocmd!
   autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Text files settings -------------------- {{{
augroup filetype_txt
   autocmd!
   autocmd FileType text NeoCompleteLock
   autocmd GuiEnter,BufWrite *.txt :set background=light
   autocmd FileType text :setlocal spell spelllang=en_us
   autocmd FileType text :setlocal textwidth=80
augroup END
" }}}

" View settings to preserve foldings --------------------- {{{
augroup save_fold
   autocmd!
   autocmd BufWinLeave *.* mkview
   autocmd BufWinEnter *.* silent loadview
augroup END
" }}}

" Syntastic setting --------------------- {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let b:syntastic_mode="passive"
let g:syntastic_c_checkers=['make', 'gcc']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" }}}

" Setting up VimShell ------------------ {{{
let g:vimshell_no_save_history_commands = {'history' : 1, 'h' : 1, 'histdel' : 1, 'cd' : 1, 'pwd' : 1}
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
nnoremap <C-n> :VimShell<CR>
nnoremap <leader>k :hi clear SpellBad<CR>
" }}}

" Setting up airline -------------------- {{{
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2
" }}}

" Basic Setting ----------------- {{{
" Disabling ex-mode
nnoremap Q <NOP>

" Backspace fix
set backspace=2

" Hide buffer don't close it
set hidden

" Search current directory recursively for opening files
set path+=**
set nocompatible

" Show current line and column number
set ruler

" Use jk to switch to normal mode
inoremap jk <ESC>

" Theme color
colorscheme solarized
set cursorline
set colorcolumn=81

if has("mac")
   set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
else
   set guifont=DejaVu\ Sans\ Mono\ 10
endif
set background=dark

nnoremap <C-m> :set background=dark<CR>


" Syntax highlighting
syntax on

" Indent the next line automatically
set autoindent

" Show command in bottom bar
set showcmd

" Number of visual spaces per TAB
set tabstop=3

" Set indentation depth to 3 columns
set shiftwidth=2

" Use space for tabs
set expandtab

" Show line numbers
set number

filetype plugin indent on

" Load the plugins for specific file types
filetype plugin on

" Enable file type detection
filetype on

" Better command-line completion
set wildmenu

" Highlight matching [{()}]
set showmatch

" Search as characters are entered
set incsearch

" Ignore case while searcing
set ignorecase

" Only search case insensitive for lower case entries
set smartcase

" Highlight matches
set hlsearch

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Confirm :q in case of unsaved changes
set confirm

" Change cursor shape for different modes (konsole KDE) ------------ {{{
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"
" if exists('$TMUX')
"    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
"    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" endif
" }}}
" }}}
