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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Lokaltog/vim-powerline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'easymotion/vim-easymotion'
Plugin 'jiangmiao/auto-pairs'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'elixir-lang/vim-elixir'
Plugin 'editorconfig/editorconfig-vim'

" Syntax Highlighting
Plugin 'dag/vim-fish'
Plugin 'eslint/eslint'
Plugin 'fatih/vim-go'
Plugin 'groenewege/vim-less'
Plugin 'skammer/vim-css-color'
Plugin 'wilsaj/chuck.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'kchmck/vim-coffee-script'
Plugin 'rust-lang/rust.vim'

" Color schemes
Plugin 'marcopaganini/termschool-vim-theme'
Plugin 'alessandroyorba/sierra'

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
call vundle#end()

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

" Cursor changes (iTerm)
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Copy/Paste and move to line end
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
