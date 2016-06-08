set hlsearch
set number
syntax on
imap jj <ESC>
colorscheme Tomorrow-Night-Bright
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
