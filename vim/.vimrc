"
"                                             ####
"                                             ####
"
"
"
"                     ####      ####      ########          ####  ####      ######  ####          ######  ##
"                     ##          ##            ##        ##    ##    ##        ####    ##      ##      ####
"                     ##          ##            ##        ##    ##    ##        ##      ##    ##          ##
"                       ##      ##              ##        ##    ##    ##        ##            ##
"                       ##      ##              ##        ##    ##    ##        ##            ##
"                       ##      ##              ##        ##    ##    ##        ##            ##
"     ##                  ##  ##                ##        ##    ##    ##        ##            ##          ##
"   ######                ##  ##                ##        ##    ##    ##        ##              ##        ##
"   ######                  ##          ################  ####  ####  ####  ############          ########
"     ##

set encoding=utf-8
scriptencoding utf-8

let OSTYPE = system('uname')
let MACOS = "Darwin\n"
let LINUX = "Linux\n"

call plug#begin('~/.vim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/vimshell.vim'
Plug 'Yggdroot/indentLine'
Plug 'aklt/plantuml-syntax'
Plug 'altercation/vim-colors-solarized'
Plug 'aonemd/kuroi.vim'
Plug 'basyura/unite-rails'
Plug 'bronson/vim-trailing-whitespace'
Plug 'chr4/nginx.vim'
Plug 'derekwyatt/vim-scala'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'hail2u/vim-css3-syntax'
Plug 'itchyny/calendar.vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'jelera/vim-javascript-syntax'
Plug 'kannokanno/previm'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'slim-template/vim-slim'
Plug 'thinca/vim-quickrun'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tyru/open-browser.vim'

call plug#end()

syntax on

try
  colorscheme kuroi
catch
endtry

set t_Co=256
set number
set ambiwidth=double
set background=dark
set backspace=indent,eol,start
set belloff=all
set colorcolumn=80,100
set cursorline
set hidden
set history=5000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set noswapfile
set number
set re=1
set ruler
set relativenumber
set showmatch
set smartcase
set wildmenu
set completeopt=menuone
set ttyfast
set lazyredraw
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set lazyredraw
set ttyfast
set splitbelow
set termwinsize=20x0

augroup FileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.erb setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.c setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.java setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd BufNewFile,BufRead *.js setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END

filetype plugin indent on

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap ( ()<LEFT>
inoremap <C-j> <Esc> `^
inoremap [ []<LEFT>
inoremap jj  <Esc> `^
inoremap { {}<LEFT>

" nnoremap <silent><C-m> :Minimap<CR>
nnoremap <C-j><C-j> :noh<CR>
nnoremap <silent> vp :VimShellPop<CR>
nnoremap <silent> vs :sp<CR><C-w><C-w>:VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <silent>S :e ++enc=shift_jis<CR>
nnoremap <silent>U :e ++enc=utf-8<CR>
nnoremap == gg=G
nnoremap j gj
nnoremap k gk
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>

vnoremap <C-j> <Esc>

noremap <expr> <C-b> max([winheight(0) - 2, 1]) . "\<C-u>" . (line('.') < 1         + winheight(0) ? 'H' : 'L')
noremap <expr> <C-f> max([winheight(0) - 2, 1]) . "\<C-d>" . (line('.') > line('$') - winheight(0) ? 'L' : 'H')
noremap <expr> <C-y> (line('w0') <= 1         ? 'k' : "\<C-y>")

let g:NERDTreeShowHidden=1
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'colorscheme': 'wombat'
      \ }
let g:loaded_syntastic_python_pylint_checker = 0

" deoplete
let g:deoplete#auto_complete_delay = 5
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_auto_delimiter = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000
let g:deoplete#min_syntax_length = 3

inoremap <expr><Tab> pumvisible() ? "\<DOWN>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<UP>" : "\<S-Tab>"

" neosnippet.vim
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" markdown
autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown
nnoremap <silent> <C-p> :PrevimOpen<CR> " Ctrl-pでプレビュー
" 自動で折りたたまないようにする
let g:vim_markdown_folding_disabled=1
