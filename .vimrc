syntax on

colorscheme monokai-phoenix

" Auto read"
set autoread
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * checktime

vnoremap <C-c> "+y

set tabstop=4


set number
set mouse=a
set wildmenu
set backspace=indent,eol,start

command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" VUNDLE CONF "
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Code formatter thanks google " 
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

" You Complete Me Autocomplete "
Plugin 'valloric/youcompleteme'

" Syntastic "
Plugin 'vim-syntastic/syntastic'

" PolyGlot Lang Support "
Plugin 'sheerun/vim-polyglot'

" NERDTree Sidebar"
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Syntastic Config " 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" NERDTree Config"
let NERDTreeShowHidden=1

" Start NERDTree when Vim starts with a directory argument."
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Open the existing NERDTree on each new tab. "
autocmd BufWinEnter * silent NERDTreeMirror

" NERD TREE BINDS " 
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
