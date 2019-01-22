set hlsearch
set number relativenumber
syntax on
imap jk <ESC>
" colorscheme Tomorrow-Night-Bright
set runtimepath^=~/.vim/bundle/ctrlp.vim
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

function! AddSubtract(char, back)
      let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
        call search(pattern, 'cw' . a:back)
          execute 'normal! ' . v:count1 . a:char
            silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction

nnoremap <silent>         <C-a> :<C-u>call AddSubtract("\<C-a>", '')<CR>
nnoremap <silent> <Leader><C-a> :<C-u>call AddSubtract("\<C-a>", 'b')<CR>
nnoremap <silent>         <C-x> :<C-u>call AddSubtract("\<C-x>", '')<CR>
nnoremap <silent> <Leader><C-x> :<C-u>call AddSubtract("\<C-x>", 'b')<CR>

noremap ; :
" nnoremap : ;

" Below config is from
" https://www.youtube.com/watch?v=XA2WjJbmmoM&t=1454s
" https://github.com/changemewtf/no_plugins/blob/master/no_plugins.vim
" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" Sudo 
" :w !sudo tee %

" Vim快速选中、删除、复制引号或括号中的内容
" ci'、ci"、ci(、ci[、ci{、ci< - 分别更改这些配对标点符号中的文本内容
" di'、di"、di(或dib、di[、di{或diB、di< - 分别删除这些配对标点符号中的文本内容
" yi'、yi"、yi(、yi[、yi{、yi< - 分别复制这些配对标点符号中的文本内容
" vi'、vi"、vi(、vi[、vi{、vi< - 分别选中这些配对标点符号中的文本内容

" Rectangle insert
" https://stackoverflow.com/questions/1174274/how-can-i-prepend-text-in-the-middle-of-the-line-to-multiple-lines-in-vim

" Autocomplete 
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option
"
" Autocomplete file path
" In INSERT MODE
" C-x C-f
"

hi ColorColumn ctermbg=NONE ctermfg=red
match ColorColumn /\%>79v.*\%<81v/

set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40 ctermbg=239

" https://github.com/junegunn/vim-plug/wiki/tutorial
" Now run :PlugInstall to install the plugins.
call plug#begin('~/.vim/plugged')

" https://github.com/junegunn/seoul256.vim
Plug 'junegunn/seoul256.vim'
Plug 'easymotion/vim-easymotion'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'https://github.com/tpope/vim-commentary.git'

call plug#end()

let g:seoul256_background = 233
"let g:seoul256_current_bg = black
silent! colo seoul256

" https://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim#answer-24047539
" easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
set winaltkeys=no
map <ESC>j <Plug>(easymotion-f)
nmap <ESC>j <Plug>(easymotion-overwin-f)
nmap cc Vgc0j
nmap , yyp

