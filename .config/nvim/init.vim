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
Plug 'lambdalisue/suda.vim'
Plug 'samoshkin/vim-mergetool'
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-eunuch'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
call plug#end()

" Update plugins weekly
function! OnVimEnter() abort
	if exists('g:plug_home')
	  let l:filename = printf('%s/.vim_plug_update', g:plug_home)
	  if filereadable(l:filename) == 0
			call writefile([], l:filename)
	  endif
	  let l:this_week = strftime('%Y_%V')
	  let l:contents = readfile(l:filename)
	  if index(l:contents, l:this_week) < 0
			call execute('PlugUpdate')
			call writefile([l:this_week], l:filename, 'a')
	  endif
	endif
endfunction
autocmd VimEnter * call OnVimEnter()

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
set expandtab
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Syntax highlighting
syntax on

" Line numbers
set number

" Relative line numbers
set relativenumber

" Line & column dispaly
set ruler

" Status bar
set laststatus=2

" Disable bells
set vb
set novisualbell
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

" Disable folding
set nofoldenable

" Enable emojis
set emoji

" Disable netrw
let loaded_netrw = 0

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
let g:lightline = {
	\ 'colorscheme': 'nord',
	\ 'component_function': {
	\   'filetype': 'MyFiletype',
	\   'fileformat': 'MyFileformat',
	\ }
	\ }
function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! MyFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

"" Conquer of Completion
" if not set, TextEdit might fail
set hidden
" more space for messages
set cmdheight=2
" avoid delays
set updatetime=300
" don't give |ins-completion-menu| messages
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" use tab to trigger completion
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" extensions
let g:coc_global_extensions=[
	\'coc-ccls',
	\'coc-json',
	\'coc-sh',
	\'coc-vimlsp',
	\'coc-markdownlint',
	\]

" NERDTree
noremap <silent> <leader>n :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeMinimalUI = 1

" Goyo
noremap <silent> <leader>g :Goyo<CR>

" Fugituve
map <leader>d :Gdiffsplit<CR>

" Colorizer
lua require'colorizer'.setup()

" Suda
let g:suda_smart_edit = 1

" Mergetool
let g:mergetool_Layout='mr'
let g:mergetool_prefer_revision='local'
noremap <silent> <leader>m <plug>(MergetoolToggle)

"" FZF
" general
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
let $FZF_DEFAULT_OPTS="--reverse"
" default command
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --no-ignore-vcs --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
endif
" files window with preview
command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" advanced grep(faster with preview)
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)
" floating fzf window with borders
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}
    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction
" keybindings
nnoremap <silent> <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>c :Commands<CR>
map <leader>r :Rg<CR>

"" Easymotion
" general
let g:EasyMotion_startofline = 0
let g:EasyMotion_smartcase = 1
" search
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
" navigation
map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)

" Markdown Preview
map <leader>mp <Plug>MarkdownPreviewToggle
