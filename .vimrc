set nu
set encoding=utf-8

set hidden

set nobackup
set nowritebackup

set cmdheight=2

if has('syntax')
    syntax on
endif

" Indent
set smartindent
set tabstop=2
set expandtab
set shiftwidth=4
set autoindent
set cindent

set updatetime=300

set shortmess+=c

if has('patch-8.1.1564')
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" : 
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <s-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


source $HOME/.vim/plug.vim
source $HOME/.vim/ext.vim
source $HOME/.vim/lang.vim
