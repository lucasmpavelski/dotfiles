""""""""""""""""
" Plugin Manager
"""""""""""""""" 

" Vim-Plug
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

""""""""""""""""""
" General settings
""""""""""""""""""

" Map leader to
let mapleader=','

" Theme
set background=dark
colorscheme nord
set termguicolors

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Disable compatibility
set nocompatible

" Disable showing modes
set noshowmode

" Tabs
set smarttab
set shiftwidth=4
set tabstop=4

" Syntax highlighting
syntax on

" Line numbers
set number

" Line & column dispaly
set ruler

" Status bar
set laststatus=2

" Disable audible bell
set vb

"Disable visual bell
set novisualbell

" Disable error bell
set noerrorbells

" Backup and swap dir
set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//

" Mouse support
set mouse=a

" Split to right & below
set splitright
set splitbelow

" Save the current buffer using the leader key
noremap <leader>w :w<CR>

" Save and exit using the leader key
noremap <leader>e :wq<CR>

" Exit without saving using the leader key
noremap <leader>q :q!<CR>

" Clipboard copy/paste/cut
if has ('unnamedplus')
	set clipboard=unnamed,unnamedplus
endif

" Copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy

" Paste from clipboard
vnoremap <leader>p "+p
vnoremap <leader>P "+P
nnoremap <leader>p "+p
nnoremap <leader>P "+P

"""""""""""""""""
" Plugin settings
"""""""""""""""""

" Lightline
let g:lightline = { 'colorscheme': 'nord' }

" Conquer of Completion
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
let g:coc_global_extensions=[
	\'coc-ccls',
	\'coc-json',
	\'coc-sh',
	\'coc-vimlsp',
	\]

" NERDTree
noremap <silent> <leader>n :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeMinimalUI = 1

" Goyo
noremap <silent> <leader>g :Goyo<CR>

" Colorizer
lua require'colorizer'.setup()
