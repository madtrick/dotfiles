" Required by vim-latex if I want to use e with accent
" See:
" http://vim-latex.sourceforge.net/index.php?subject=faq&title=FAQ#faq-e-acute
imap <buffer> <leader>it <Plug>Tex_InsertItemOnThisLine

" But the solution given in the faq is not enough. We have to remove
" the mapping too
iunmap <buffer> é
