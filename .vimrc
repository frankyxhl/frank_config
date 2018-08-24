set hlsearch
set number
syntax on
imap jj <ESC>
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
