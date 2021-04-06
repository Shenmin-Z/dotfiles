set nocompatible

let mapleader = ' '

" Show line number
set number
set relativenumber

" Tab
set tabstop=2
set shiftwidth=2
set expandtab
nnoremap <Leader>4 :setlocal shiftwidth=4 tabstop=4<CR>
nnoremap <Leader>2 :setlocal shiftwidth=2 tabstop=2<CR>

" Visuals
set encoding=utf-8
set t_CO=256

" Search
set hlsearch
set incsearch
set ignorecase
set smartcase
" normal regex
nnoremap / /\v

" ReaLoad a file if was changed outside of Vim
set autoread

" Giff target<-local copy->merge
set diffopt+=vertical

noremap <Leader>w :write<CR>
noremap <Leader>q <C-W><C-C>
noremap <Leader>l :set cursorcolumn!<CR>

" No highlight
nnoremap <C-C> :nohl<CR><C-C>

" Source vimrc
nnoremap <Leader>s :source<space>$MYVIMRC<CR>
" edit vimrc
nnoremap <Leader>e :edit<space>$MYVIMRC<CR>

" open help vertically
cabbrev h vertical help

set nofixendofline

set hidden

set updatetime=100

set termguicolors

" Neovim terminal
autocmd TermOpen * setlocal nonumber norelativenumber
tnoremap <Esc> <C-\><C-n>

set clipboard+=unnamedplus

set nobackup
set nowritebackup
set noundofile
set noswapfile

" ----------*---------- ----------*---------- ----------*---------- "

call plug#begin('~/.vim/plugged')
  Plug 'morhetz/gruvbox'

  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree'
  Plug 'google/vim-searchindex'

  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'

  Plug 'tpope/vim-surround'
  Plug 'Raimondi/delimitMate'

  " Completion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " HTML
  Plug 'mattn/emmet-vim'

  " JavaScript/TypeScript
  Plug 'leafgarland/typescript-vim'
  Plug 'pangloss/vim-javascript'
  Plug 'peitalin/vim-jsx-typescript'

  " Go
  Plug 'sebdah/vim-delve'

  " Formatter
  Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'json', 'markdown', 'html'] }
  Plug 'godlygeek/tabular'
call plug#end()

set background=dark
colorscheme gruvbox

" fzf
let g:fzf_preview_window = ''
nnoremap <Leader>b :Buffers<CR>
nnoremap <C-P> :GFiles --recurse-submodules<CR>
nnoremap <Leader>m :Commands<CR>
nnoremap <Leader>rg yiw:Rg <C-R>"<CR>
nnoremap <Leader>rr yiw:Rg <C-R>" <C-R>%
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.<q-args>, 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Prettier
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
nnoremap gp :silent %!prettier --no-config --stdin --stdin-filepath % --trailing-comma all --single-quote<CR>

" NerdCommenter
let g:NERDDefaultAlign = 'left'
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" GitGutter
let g:gitgutter_map_keys = 0

" NerdTree
let NERDTreeShowHidden=1
nmap <Leader>n :NERDTree
nmap <Leader>nf :NERDTreeFind<CR>
nmap <Leader>nc :NERDTreeClose<CR>
nmap <Leader>nv :NERDTreeVCS<CR>

" Fugitive
nmap <Leader>gb :Gblame<CR>

" COC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> dp <Plug>(coc-diagnostic-prev)
nmap <silent> dn <Plug>(coc-diagnostic-next)
nmap <leader>rn <Plug>(coc-rename)
command! -nargs=0 Format :call CocAction('format')
nmap <leader>f :Format<CR>

" Emmit
let g:user_emmet_leader_key='<s-tab>'
