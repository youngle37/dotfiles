" Shortcut for getting output.
nnoremap <F5> :w <CR> :!g++ -std=c++11 % && ./a.out <CR>

" vim-autoformat setting.
let g:formatdef_youngle = '"astyle --style=attach --pad-oper"'
let g:formatters_cpp = ['youngle']
noremap <F3> :Autoformat<CR>
