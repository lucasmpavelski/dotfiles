" Map leader to
let mapleader=','

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
	let g:lightline = { 'colorscheme': 'nord' }

Plug 'arcticicestudio/nord-vim'

Plug 'junegunn/goyo.vim'

Plug 'tpope/vim-surround'

Plug 'junegunn/fzf.vim'
	let g:fzf_action = {
	  \ 'ctrl-t': 'tab split',
	  \ 'ctrl-x': 'split',
	  \ 'ctrl-v': 'vsplit' }
	let g:fzf_layout = { 'down': '60%' }
	let g:fzf_layout = { 'window': 'enew' }
	let g:fzf_layout = { 'window': '-tabnew' }
	let g:fzf_layout = { 'window': '10new' }
	let g:fzf_colors =
	\ { 'fg':      ['fg', 'Normal'],
	  \ 'bg':      ['bg', 'Normal'],
	  \ 'hl':      ['fg', 'Comment'],
	  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
	  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
	  \ 'hl+':     ['fg', 'Statement'],
	  \ 'info':    ['fg', 'PreProc'],
	  \ 'border':  ['fg', 'Ignore'],
	  \ 'prompt':  ['fg', 'Conditional'],
	  \ 'pointer': ['fg', 'Exception'],
	  \ 'marker':  ['fg', 'Keyword'],
	  \ 'spinner': ['fg', 'Label'],
	  \ 'header':  ['fg', 'Comment'] }
	nnoremap <silent> <leader>f :FZF<cr>
	nnoremap <silent> <leader>F :FZF ~<cr>

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	let g:deoplete#enable_at_startup = 1

Plug 'dense-analysis/ale'
	let g:ale_sign_column_always = 1
	let g:ale_lint_on_text_changed = 'never'
	let g:ale_fix_on_save = 1

call plug#end()

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
"set expandtab
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

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

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
