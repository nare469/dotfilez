set shell=bash "fish
" Leader mappings
let mapleader = " "
nnoremap <leader>a :echo("\<leader\> works! It is set to <leader>")<CR>
nnoremap <leader>w <C-w>w
nnoremap <leader>- 2<C-w>-
nnoremap <leader>= 2<C-w>+
nnoremap <leader>< 2<C-w><
nnoremap <leader>> 2<C-w>>
nnoremap <leader>c :CtrlPClearCache<CR>
nnoremap <leader>h :nohlsearch<CR>
nmap <tab> gt
nmap <s-tab> gT
" Window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

call plug#begin('~/.vim/plugged')

Plug 'Lokaltog/vim-powerline'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'

" Syntax Hhlighting
Plug 'dag/vim-fish'
Plug 'eslint/eslint'
Plug 'fatih/vim-go'
Plug 'isRuslan/vim-es6'
Plug 'kchmck/vim-coffee-script'
Plug 'rust-lang/rust.vim'
Plug 'dart-lang/dart-vim-plugin'

" Color schemes
Plug 'marcopaganini/termschool-vim-theme'
Plug 'alessandroyorba/sierra'

function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.sh
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()

set nocompatible
set ruler
set cursorline

syntax on
filetype off
filetype plugin indent on

set encoding=utf-8 "UNICODE GLYPHS
set nobackup

syntax enable
set number
set showcmd
set hlsearch
set showmode
set wildmenu

set laststatus=2 "for powerline
set expandtab
set shiftwidth=4
set tabstop=4

set autoindent
set smartindent

set pastetoggle=<F2>

set backspace=indent,eol,start
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))

"Make splitting work better
set splitright
set splitbelow

" Close the scratch preview for YouCompleteMe automatically
autocmd CompleteDone * pclose

"get rid of old habits~
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Undo directory
set undofile
set undodir=~/.vimundo/

colorscheme sierra
set t_Co=256
set rnu

let g:ctrlp_working_path_mode = 'ra'

" Remove extra whitespace before saving
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" YCM conf file
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" Copy/Paste and move to line end
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" FZF Settings
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~30%' }

nnoremap <C-p> :FZF<CR>
