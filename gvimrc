" No toolbar
set guioptions-=T

" No menu
set guioptions-=m

" Set colorscheme
color molokai


highlight Normal guibg=black "Change background for molokai theme
highlight SpecialKey guibg=red " Set a red background for 'listchars'
highlight CursorLine guibg=#121212

" Patche{ font for vim-powerline
if has("gui_macvim")
  set guifont=Menlo\ Regular:h13
else
  set guifont="Menlo-Powerline"
endif

"
" Code stolen from Janus {{{
"
if exists("loaded_nerd_tree")
  autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
  autocmd FocusGained * call s:UpdateNERDTree()
endif

" If the parameter is a directory, cd into it
function! s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0 
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" NERDTree utility function
function! s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif
endfunction

"
" End code stolen from Janus
"}}}

" vim:fdm=marker
