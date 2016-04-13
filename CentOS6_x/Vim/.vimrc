"-------------------------------------------------
" Color Scheme設定
"-------------------------------------------------

set number
 
" Solarized
syntax enable
set background=dark
let g:solarized_termcolors=256
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_termtrans=0
let g:solarized_contrast="high"
let g:solarized_visibility="high"
imap <C-j> <esc>
set autoindent
set expandtab
set showmatch
set smarttab 
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
