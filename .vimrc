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
"Plugin 'moll/vim-node'
Plugin 'jpalardy/vim-slime'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
Plugin 'stephpy/vim-yaml'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'rosstimson/scala-vim-support'

call vundle#end()            " required
filetype plugin on
filetype indent on
syntax enable
syntax on
set pastetoggle=<f5>

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
" backspace
set bs=2


" use tmux with slime
let g:slime_target = "tmux"
let g:slime_python_ipython = 1

" background stuff
colorscheme solarized

if has('gui_running')
	set background=light
else
	set background=light
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
let vimrplugin_assign=2
"let maplocalleader = ","

"fugitive config
set statusline+=%{fugitive#statusline()}
autocmd QuickFixCmdPost *grep* cwindow

" Syntastic
let g:syntastic_ignore_files = ['\.py$']
let g:syntastic_ignore_files = ['\.tex$']
let g:syntastic_ignore_files = ['\.rst$']
let g:pymode_lint = 0
let g:pymode_trim_whitespaces = 0
let g:syntastic_tex_checkers=['']
let g:pymode_options_max_line_length = 80
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
autocmd FileType R setlocal shiftwidth=2 expandtab tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 expandtab tabstop=2
autocmd FileType json setlocal shiftwidth=2 expandtab tabstop=2
autocmd FileType css setlocal shiftwidth=2 expandtab tabstop=2

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn


" Python-mode
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
" Dectivate rope
let g:pymode_rope = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_lookup_project = 0


" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
" Auto check on save
let g:pymode_lint_on_write = 1
" Ignore the long line
" let g:pymode_lint_ignore = "E501,W"

" Support virtualenv
let g:pymode_virtualenv = 0

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
":inoremap <Leader>z <c-w>w<c-y><c-w>w
":nnoremap <Leader>z <c-w>w<c-y><c-w>w

"""""""""""""""""""""ergo
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>"
nnoremap <Space> zz

" paragraph formatting
vmap Q gq
nmap Q gqap

" text stuff
set textwidth=80

" scala
" let g:scala_scaladoc_indent = 1

" latex
let g:LatexBox_Folding = 1
let g:LatexBox_quickfix = 1
let g:LatexBox_fold_automatic= 2
"if s:extfname ==? "tex"
"	let g:LatexBox_split_type="new"
"endif

" wc in tex from Konrad Rudolph to count whole document
function! WC()
	let filename = expand("%")
	let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
	let result = system(cmd)
	echo result . " words"
endfunction

command! WC call WC()

" call this on a region with RC
function! WCr() range
	let cmd = 'echo '.shellescape(join(getline(a:firstline, a:lastline), "\n ")).'| detex | wc -w | tr -d [:space:]'
	let result = system(cmd)
	echo result . " words"
endfunction

com! -range=% -nargs=0 RC :<line1>,<line2>call WCr()

" syc
"
let g:LatexBox_latexmk_options
			\ = "-pdflatex='pdflatex -synctex=1 \%O \%S'"

" args list from quickfix
" from  https://stackoverflow.com/questions/5686206/search-replace-using-quickfix-list-in-vim
" use cdo or cfdo instead!
