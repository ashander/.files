" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
" backspace
set bs=2

" Vundle load
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-rmarkdown'


syntax enable
filetype plugin indent on
syntax on

" background stuff
set background=dark
colorscheme solarized

if has('gui_running')
	set background=light
else
	set background=dark
endif

" show status
set laststatus=2
" highlight trailing ws
match ErrorMsg '\s\+$'

" powerline setup
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
"set laststatus=2

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1
" Ignore the long line
" let g:pymode_lint_ignore = "E501,W"

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" py-unit-remap
"noremap ,t :call PyUnitRunTests()<CR>
"noremap! ,t <Esc>:call PyUnitRunTests()<CR>

"markdown options
let g:vim_markdown_folding_disabled=1


" key mappings
:nnoremap ; $
map <Down> <c-w>w<c-e><c-w>w
map <Up> <c-w>w<c-y><c-w>w
":inoremap <Leader>z <c-w>w<c-y><c-w>w
":nnoremap <Leader>z <c-w>w<c-y><c-w>w

" paragraph formatting
vmap Q gq
nmap Q gqap

" remap leader for ergo
let mapleader = ","
