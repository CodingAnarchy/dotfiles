scriptencoding utf-8
set encoding=utf-8
set nocompatible              " be iMproved, required
set laststatus=2
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'dag/vim-fish'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'sjl/gundo.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ck3g/vim-change-hash-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elixir-editors/vim-elixir'
Plugin 'chemzqm/vim-jsx-improve'
Plugin 'rodjek/vim-puppet'
Plugin 'hashivim/vim-terraform'
Plugin 'rainerborene/vim-reek'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'dense-analysis/ale'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

call vundle#end()            " required
syntax enable
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

if has('mouse_sgr')
    set ttymouse=sgr
endif

set mouse=a
set clipboard=unnamed
set autoindent "indent if previous line is indented
set smartindent "indent after brackets
set backspace=2
set tabstop=2 expandtab softtabstop=2 shiftwidth=2 smarttab
set number "enables line numbering
set relativenumber "enables relative line numbering
set shell=bash
set splitright splitbelow
set maxmempattern=5000 "don't break syntax highlighting on large base64 values
let g:rspec_runner = "os_x_iterm"
let g:jsx_ext_required = 0
let g:python_recommended_style = 0

" Set up :make to use fish for syntax checking
autocmd FileType fish compiler fish
autocmd FileType fish setlocal textwidth=79
autocmd FileType fish setlocal foldmethod=expr

"Autocompletion stuff
set wildmenu
set wildmode=longest:list,full

autocmd filetype crontab setlocal nobackup nowritebackup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree mappings
map <C-t> :NERDTreeToggle<CR>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" EasyMotion settings
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
 
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
 
" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Syntax highlighting for *.prawn files
au BufNewFile,BufRead *.prawn set filetype=ruby

" Use ag (the_silver_searcher) for the ack program
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
endif

let g:reek_always_show = 0
let g:reek_line_limit = 1000

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:ruby_indent_assignment_style = "variable"

" Set specific linters
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop', 'sorbet', 'brakeman'],
\}

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
" Disable ALE auto highlights
let g:ale_set_highlights = 0

let g:airline#extensions#ale#enabled = 1
