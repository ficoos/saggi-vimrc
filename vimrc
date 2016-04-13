" Disable toolabar
" has to be the first thing you do to prevent slow load times
set guioptions=aegiMLc
:aunmenu *

"GUI hacks
if has("gui_running")
   "Paste from clipboard in normal mode
   nmap <S-INS> "+gP
   "Paste from clipboard in insert mode
   imap <S-INS> <c-r>+
   "Copy to system clipboard
   vmap <C-S-C> "+y
   " Hide the mouse pointer while typing
   set mousehide
endif

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles
Bundle 'altercation/vim-colors-solarized'
Bundle 'cespare/vim-toml'
Bundle 'ciaranm/inkpot'
Bundle 'embear/vim-localvimrc'
Bundle 'fatih/vim-go'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'majutsushi/tagbar'
Bundle 'Markdown'
Bundle 'OrangeT/vim-csharp'
Bundle 'rstacruz/sparkup'
Bundle 'scrooloose/syntastic'
Bundle 'tikhomirov/vim-glsl'
Bundle 'tpope/vim-fugitive'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'vim-scripts/colorschemer'
Bundle 'vim-scripts/mediawiki.vim'
Plugin 'rust-lang/rust.vim'

"Python-mode

" don't use linter, we use syntastic for that
let g:pymode_lint_on_write = 0
let g:pymode_lint_signs = 0
" don't fold python code on open
let g:pymode_folding = 0
" don't load rope by default. Change to 1 to use rope
let g:pymode_rope = 0
" open definitions on same window, and custom mappings for definitions and
" occurrences
let g:pymode_rope_goto_definition_bind = ',d'
let g:pymode_rope_goto_definition_cmd = 'e'
nmap ,D :tab split<CR>:PymodePython rope.goto()<CR>
nmap ,o :RopeFindOccurrences<CR>


" Syntastic
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 1

" Checks for vala and java are buggy and annoying
let g:syntastic_vala_check_disabled = 1
let g:syntastic_java_check_disabled = 1

let g:syntastic_python_checkers=['flake8']
let g:syntastic_javascript_checkers = ['eslint']

"Go support
let g:ycm_semantic_triggers =  {
  \   'go' : ['.'],
  \   'rust' : ['::', '.'],
  \   'lua' : ['.', ':'],
  \ }

"Git
:au Filetype gitcommit setlocal spell

"Filetype fix
:filetype on


"cscope
if filereadable("cscope.out")
    set nocscopeverbose
    cs add cscope.out
    set cscopeverbose
endif

":autocmd FileType c,cpp,h nmap <C-]> :cs find g <C-R>=expand("<cword>")<CR><CR>
":autocmd FileType c,cpp,h nmap <C-\> :cs find c <C-R>=expand("<cword>")<CR><CR>

"Code jumping
:autocmd FileType python nmap <C-\> :YcmCompleter GoToDeclaration<CR>
:autocmd FileType * nmap <A-\> :Ggrep "\<<cword>\>" -- *.[ch]<CR>
:autocmd FileType python nmap <C-]> :YcmCompleter GoToDefinition<CR>
:autocmd FileType python map <silent> <leader>b oimport ipdb; ipdb.set_trace()  # breakpoint<esc>
:autocmd FileType python map <silent> <leader>B Oimport pdb; pdb.set_trace()  # breakpoint<esc>
:autocmd FileType go nmap <C-]> gd
:let g:godef_split = 0

"cmdline completion
set wildmenu

"Colors
set t_Co=256
let g:solarized_termcolors=256

"Inkpot scheme
:let g:inkpot_black_background = 1
set background=dark
"colorscheme inkpot
"colorscheme solarized
colorscheme cobalt

"Incremental search
:set incsearch

"Better autocopmlete
:set completeopt=longest,menuone

"Indentation
set autoindent
:autocmd FileType javascript,css,html,python,cython,vala,lua setlocal expandtab
:autocmd FileType javascript,css,html,python,cython,vala,lua setlocal shiftwidth=4
:autocmd FileType javascript,css,html,python,cython,vala,lua setlocal softtabstop=4
:autocmd FileType go setlocal tabstop=4
:autocmd FileType * setlocal autoindent
:autocmd FileType vala setlocal cindent
filetype plugin indent on

"Whitespace handling
:com! CleanExtraWhitespace :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))"
:nnoremap <silent> <F5> :CleanExtraWhitespace <CR>
:autocmd BufWritePre \(*.py\|*.[ch]\|*.go\|*.java\|*.cs\|*.cpp\) :CleanExtraWhitespace

:highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
:au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
:au InsertLeave * match ExtraWhitespace /\s\+$/

"Tab mappings
:nmap <A-LEFT> :tabp<CR>
:nmap <A-RIGHT> :tabn<CR>
:nmap <C-S-T> :tabnew<CR>

"quickfix mappings
:nmap <A-DOWN> :cn<CR>
:nmap <A-UP> :cp<CR>

"Reread vimrc on update
:au! BufWritePost $MYVIMRC source $MYVIMRC

"Workaround netrw cursorline bug
:au! BufWritePost * set nocursorline

"Pyflakes fix
let g:pyflakes_use_quickfix = 0

"tagbar
" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1


"Disable EX mode
:map Q <Nop>

"Map F9 to build
:nnoremap <silent> <C-B> :make<CR>
:nnoremap <silent> <F9> :make<CR>

"Map F10 to test
:nnoremap <silent> <F10> :make test<CR>

"Map F11 to run
:nnoremap <silent> <F11> :make run<CR>

"Map F11 to nohl
:nnoremap <silent> <F12> :nohl<CR>

"Highlight column 80
:set colorcolumn=80
:highlight ColorColumn guibg=#073662

"wildignore
"python
:set wildignore+=*.pyc,*.pyo
"c/cpp
:set wildignore+=*.o,*.obj
"editors
:set wildignore+=*.swp,*~
"java
:set wildignore+=*.class
"VCS
:set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

"ctrlp
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ }
\ }

"Less mode shortcut
:com! LESS :source /usr/share/vim/vim*/macros/less.vim*

"Beutify
" for go
:autocmd FileType go noremap <silent> <c-f> :Fmt<cr>
let g:gocode_gofmt_tabwidth =""

:noremap <c-g> :Ggrep


"airline
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme = 'molokai'

"lvimrc
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0

"vim-go
let g:go_auto_type_info = 1

set autowrite

"racer
let g:racer_cmd = "/home/saggi/projects/racer/target/racer"
let $RUST_SRC_PATH="/home/saggi/projects/rust/src/"
