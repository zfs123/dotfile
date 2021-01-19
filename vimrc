""""""""""""""""""""
"My Configuration
""""""""""""""""""""
ec "(>^.^<)"
set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cindent
set autoindent
set expandtab 
set hlsearch
set autoread

"""""""""""""""""""""
"pathogen
"""""""""""""""""""""
call pathogen#infect()
syntax on
filetype plugin indent on

"""""""""""""""""""""
"tagbar
"""""""""""""""""""""
nmap fg :TagbarToggle<CR>
let g:tagbar_width=30
autocmd BufReadPost *.c call tagbar#autoopen()
let g:tagbar_right=1

"""""""""""""""""""""
"Code Template
"""""""""""""""""""""
autocmd BufNewFile *.py 0r ~/.vim/template/python.tpl
autocmd BufNewFile ex.cc 0r ~/.vim/template/cpp.tpl
autocmd BufNewFile *.pl 0r ~/.vim/template/perl.tpl
autocmd BufNewFile *.php 0r ~/.vim/template/php.tpl
autocmd BufNewFile ex.c 0r ~/.vim/template/c.tpl
autocmd BufNewFile test.java 0r ~/.vim/template/java.tpl
autocmd BufNewFile *.rb 0r ~/.vim/template/ruby.tpl

""""""""""""""""""""""
"Quickly Run
""""""""""""""""""""""
map cc :call AutoCompileRun()<CR>
vmap ccc :call AutoCompileRun()<CR>

func! AutoCompileRun()
  exec "w"
  if &filetype == 'c'
    exec "!gcc % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!java %<"
  elseif &filetype == 'python'
    exec "!time python %"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'html'
    exec "!firefox % &" 
  endif
endfunc
