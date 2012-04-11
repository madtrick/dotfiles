" Leader key
let mapleader="ñ"


" Backpsace everywhere in insert mode
set backspace=start,eol,indent
set tabstop      =2
set softtabstop  =2
set shiftwidth   =2
set expandtab
set number
set nobackup
set nowritebackup
set backupdir    =~/.vim/backup
set directory    =~/.vim/backup
set laststatus   =2
set hlsearch
set incsearch
set ignorecase
set smartcase
set equalalways
set list
set listchars-=eol:$
set listchars+=tab:..
set listchars+=trail:.
set showbreak=↪
set cursorline
set scrolloff    =999
set wildmenu
set wildmode=list:longest
set nocompatible               " be iMproved
filetype off                   " required! by vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Load all the other plugins
source ~/.vim/bundles
let g:bundles_file ="~/.vim/bundles"

" Enable syntax highlight
syntax enable

" vim colorscheme for terminal
if !has("gui_running")
	color impact
endif

" Filetype
filetype plugin indent on

"
" Mappings
"

" Easy .vimrc edition
nnoremap <leader>e :vsplit ~/.vimrc<CR>
nnoremap <leader>s :source ~/.vimrc<CR>
nnoremap <leader>gs :source ~/.gvimrc<CR>

" Bundle shortcuts
nnoremap <leader>Bs :BundleSearch<CR>
nnoremap <leader>Bl :BundleList<CR>
nnoremap <leader>Bi :BundleInstall<CR>
nnoremap <leader>Bf :edit ~/.vim/bundles<CR>

" Move with ease
nnoremap <A-left>   <C-w>h
nnoremap <A-right>  <C-w>l
nnoremap <A-up>     <C-w>k
nnoremap <A-down>   <C-w>j

nnoremap <tab> <C-w>w | "Fast cycling between windows

" Hacky mapping to show TODOS
" currently only search in the src/ of the working dir
nnoremap <leader>sT :silent execute 'Ack "TODO" '. getcwd() .'/src'<cr>

" Help mappings
nnoremap <leader>H :vert help<space>

nnoremap <space>  @q "Execute the macro in register q
nnoremap <space><space> @@ "Execute again last executed macro

nnoremap <BS> :nohlsearch<CR>

inoremap <C-e> <ESC>A | "Go to EOL in insert mode

nnoremap j gj "up/down movement on wrapped lines
nnoremap k gk

inoremap jj <ESC> " Esc is so far away without this mapping...


"
" Autocommands
"

" Set erb files with coffeescript in it, to be interpreted as coffee
autocmd BufRead *.coffee.erb :set ft=coffee

" Move all vim help files to the right
augroup Help2Right
  autocmd!
  autocmd BufRead $HOME/.vim/*/doc/* :wincmd L
  autocmd BufRead */vim/*/doc/* :wincmd L
augroup end

" Close help without :q
augroup HelpClose
  autocmd!
  autocmd! BufRead */vim/*/doc/* :nmap <buffer> q :q<CR> " Close help with q (local mapping)
  autocmd! BufRead $HOME/.vim/*/doc/* :nmap <buffer> q :q<CR>
augroup end


function! LastBundle()
  echo g:bundles_file
  let l:vimrc_window = bufwinnr(expand(g:bundles_file)) " Find current window for .vimrc. If any
  if (l:vimrc_window == -1)
    :exec "vsplit +" g:bundles_file | "Open in a separate split a move to the last line "+"
  else
    :exec l:vimrc_window . "wincmd w"
  endif

  call search("^Bundle", "bc") "Find Bundle backwards
endfunction

function! AddBundle()
  call LastBundle()
  :normal! oBundle ''
endfunction

command! AddBundle :call AddBundle()
