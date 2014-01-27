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
Bundle 'Syntastic'
Bundle 'Markdown'
Bundle 'Valloric/YouCompleteMe'
Bundle 'embear/vim-localvimrc'
Bundle 'tpope/vim-fugitive'
Bundle 'Blackrush/vim-gocode'
Bundle 'kchmck/vim-coffee-script'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'

Bundle 'ciaranm/inkpot'
Bundle 'altercation/vim-colors-solarized'

" Syntastic
let g:syntastic_echo_current_error = 1
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_auto_jump = 1
let g:syntastic_auto_loc_list = 1

" Checks for vala and java are buggy and annoying
let g:syntastic_vala_check_disabled = 1
let g:syntastic_java_check_disabled = 1

"Go support
let g:ycm_semantic_triggers =  {
  \   'go' : ['.'],
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

:autocmd FileType c,cpp,h nmap <C-]> :cs find g <C-R>=expand("<cword>")<CR><CR>
:autocmd FileType c,cpp,h nmap <C-\> :cs find c <C-R>=expand("<cword>")<CR><CR>

"Code jumping
:autocmd FileType python nmap <C-\> :Ggrep "^\s*[^\#].*\<<cword>\>" -- *.py<CR>
:autocmd FileType * nmap <A-\> :Ggrep "\<<cword>\>" -- *.[ch]<CR>
:autocmd FileType python nmap <C-]> :Ggrep "\(class\\|def\)\s\+<cword>\s*[(:]" -- *.py<CR>
:autocmd FileType go nmap <C-]> :call GodefUnderCursor()<CR>
:let g:godef_split = 0

"cmdline completion
set wildmenu

"Colors
set t_Co=256
let g:solarized_termcolors=256

"Inkpot scheme
:let g:inkpot_black_background = 1
"colorscheme inkpot
set background=dark
colorscheme solarized

"Incremental search
:set incsearch

"Better autocopmlete
:set completeopt=longest,menuone

"Indentation
set autoindent
:autocmd FileType javascript,css,html,python,cython,vala,lua setlocal expandtab
:autocmd FileType javascript,css,html,python,cython,vala,lua setlocal shiftwidth=4
:autocmd FileType javascript,css,html,python,cython,vala,lua setlocal softtabstop=4
:autocmd FileType * setlocal autoindent
:autocmd FileType vala setlocal cindent
filetype plugin indent on

"Whitespace handling
:com! CleanExtraWhitespace :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))"
:nnoremap <silent> <F5> :CleanExtraWhitespace <CR>
:autocmd BufWritePre \(*.py\|*.[ch]\|*.go\|*.java\|*.cpp\) :CleanExtraWhitespace

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

"Disable EX mode
:map Q <Nop>

"Map F9 to build
:nnoremap <silent> <C-B> :make<CR>

"Map F10 to test
:nnoremap <silent> <F10> :make test<CR>

"Map F11 to run
:nnoremap <silent> <F11> :make run<CR>

"Highlight column 80
:set colorcolumn=80
:highlight ColorColumn guibg=#073642

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


"airline
set laststatus=2
let g:airline_enable_branch = 1
let g:airline_enable_syntastic = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme = 'solarized'

"lvimrc
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
