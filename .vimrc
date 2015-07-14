" Vundle load
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
call vundle#rc()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-scripts/vim-R-plugin'
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'jalvesaq/R-Vim-runtime'
Plugin 'LaTeX-Box-Team/LaTeX-Box'


call vundle#end()            " required
filetype plugin indent on
syntax enable
syntax on

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
" backspace
set bs=2


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

" tab completion
set wildmode=longest,list,full

" highlight trailing ws
match ErrorMsg '\s\+$'

" R config
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
let vimrplugin_applescript=0
let vimrplugin_vsplit=1
let maplocalleader = ","

"fugitive config
set statusline+=%{fugitive#statusline()}
autocmd QuickFixCmdPost *grep* cwindow

" Syntastic
let g:syntastic_ignore_files = ['\.py$']
let g:syntastic_ignore_files = ['\.tex$']
let g:pymode_lint = 0
let g:syntastic_tex_checkers=['']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

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
let g:pymode_breakpoint_bind = '<Leader>b'

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
map <Down> <c-w>w<c-e><c-w>w
map <Up> <c-w>w<c-y><c-w>w
":inoremap <Leader>z <c-w>w<c-y><c-w>w
":nnoremap <Leader>z <c-w>w<c-y><c-w>w

"""""""""""""""""""""ergo
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>"
let mapleader = ","

nnoremap <Space> zz

" paragraph formatting
vmap Q gq
nmap Q gqap

" text stuff
set textwidth=80

" latex
let g:LatexBox_Folding = 1
let g:LatexBox_quickfix = 1
let g:LatexBox_fold_automatic= 2
"if s:extfname ==? "tex"
"	let g:LatexBox_split_type="new"
"endif


