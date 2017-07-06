set shell=fish
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
" Window navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'Lokaltog/vim-powerline'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'

" Syntax Hhlighting
Plug 'vim-syntastic/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'
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
set shiftwidth=2
set tabstop=2

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

" Use 'wal' (https://github.com/dylanaraps/wal) to get colour schemes
colorscheme sierra
set t_Co=256
set rnu

let g:ctrlp_working_path_mode = 'ra'

" Remove extra whitespace before saving
let s:can_strip = 1
function! <SID>StripTrailingWhitespaces()
    if s:can_strip
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " Do the business:
        %s/\s\+$//e
        " Clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endif
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
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~30%' }

nnoremap <C-p> :FZF<CR>

" Settings for work
let g:python_recommended_style=0
set ts=2
set sw=2

" Syntastic stuff
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_flake8_exec = 'python2'
let g:syntastic_python_flake8_args = ['-m', 'flake8', '--ignore', 'E129,E127,E302,E131,E111,E114,E121,E501,E126,E123,E305,I101,I100,N806,F403,E241,E731,F999,F401,F405']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = '/Users/naren/sigopt-api/node_modules/.bin/eslint'
