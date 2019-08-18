set encoding=utf-8
scriptencoding utf-8

call plug#begin('~/.vim/plugged')

" ******** deoplete.nvim *******
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" ******** deoplete.nvim *******
"
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Yggdroot/indentLine'
Plug 'aklt/plantuml-syntax'
Plug 'aonemd/kuroi.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'derekwyatt/vim-scala'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'leafgarland/typescript-vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-rails'

call plug#end()

syntax on

set t_Co=256
set number
set ambiwidth=double
set background=dark
set backspace=indent,eol,start
set belloff=all
set colorcolumn=80,100
set hidden
set history=5000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set noswapfile
set number
set ruler
set showmatch
set smartcase
set wildmenu
set completeopt=menuone

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

try
  colorscheme kuroi
catch
endtry

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

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 3
let g:deoplete#enable_auto_delimiter = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 20
let g:deoplete#min_syntax_length = 3

" neosnippet.vim
inoremap <expr><Tab> pumvisible() ? "\<DOWN>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<UP>" : "\<S-Tab>"

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
