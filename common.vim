"""""""""""""""" My shortcuts and personal preferences """""""""""""""""""""""

" Map jk to Escape
tnoremap jk <C-\><C-n>
inoremap jk <Esc>

"Clear searchhighlight on press "enter"
nnoremap <silent> <cr> :nohlsearch<cr><cr>

" Ctrl + hjkl to move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-c> <C-w>c

" Make 'Y' act like 'D' and 'C'
nnoremap Y y$

" Convert selected text in visual mode to hex with ";"
vnoremap ; :<c-u>s/\%V./\=printf("%x",char2nr(submatch(0)))/g<cr><c-l>`<

" Cycle through buffers with <leader>n and <leader>N
nnoremap <silent> <leader>n :bn<cr>
nnoremap <silent> <leader>N :bp<cr>

" Cycle through quickfix list with <leader>c and <leader>C
nnoremap <silent> <leader>c :cn<cr>
nnoremap <silent> <leader>C :cp<cr>

" Delete buffer without closing window
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<cr>

" Input python docstring with <leader>d
nnoremap <leader>d o""""""<Esc>hhi

" Input python breakpoint with <leader>b
nnoremap <leader>b obreakpoint()<Esc>

" Spell check in current buffer
nnoremap <silent> <leader>s :setlocal spell spelllang=en_us<CR>
nnoremap <silent> <leader>S :setlocal nospell<CR>

" Toggle fold
nnoremap <leader>f zA
" Syntax fold, for C-like languages
nnoremap <silent> <leader>Fs :set foldmethod=syntax<CR>
" Indent fold for python
nnoremap <silent> <leader>Fi :set foldmethod=indent<CR>
" Open all folds
nnoremap <silent> <leader>Fn :set foldmethod=manual<CR>zR

" Terminal shortcuts
"
" <leader>t => open existing terminal in new tab
" <leader>T => open new terminal in new tab
" tt => open existing terminal in current window
nnoremap <silent> <leader>t :tabnew<CR>:buffer ter<Tab><CR>
nnoremap <silent> <leader>T :tabe +ter<CR>
nnoremap <silent> tt :buffer term<Tab><CR>

" E to enter netrw from normal mode
nnoremap E :E<cr>

" Open peps quickly, if present
command -nargs=+ Pep :e ~/repos/peps/pep-<args>.txt


"""""""""""""""""""" Snippets """"""""""""""""""""""""""""""""""""""""""""""""

source $HOME/.vim/snippets.vim


"""""""""""""""""""" General purpose vim settings """"""""""""""""""""""""""""
"   You can get more info on all of these with :help ____, but I like having
"   the notes right here so others can just copystuff and know what it does
"   without doing a vim-help-research-project.
set showtabline=2           " Always show file name at the top
syntax on                   " Enable syntax highlighting
set nowrap                  " Do not wrap lines; not good for all files, but my preference!
set showcmd                 " Normal mode; show keys you pressed (bottom-right)
set exrc                    " allow plugins to execute .vimrc files
set secure                  " recommended to accompany 'set exrc'
set number relativenumber   " turn cursor-relative line numbering on
set path+=,$PWD/**           " Update find path to search up to 5 subdirectories
set list                    " Display tabs and trailing whitespace
set wildmenu                " Completion suggestions listed on <tab> press
set lazyredraw              " Do not draw when executing macros, etc
set colorcolumn=80          " Ruler at 80 chars

" The next four settings completely prevent vim from backing your work up
" anywhere. If, like me, you type :w after basically every line you write,
" you'll be ok!
set hidden
set nobackup
set nowritebackup
set noswapfile

set wildignore+=*.pyc,*.pyo,*/__pycache__/*     " Python
set wildignore+=*.o,*.ko,*.obj,*.dSYM           " C
set wildignore+=*.swp,~*                        " Temp files
set wildignore+=*.zip,*.tar                     " Archives
set wildignore+=node_modules/*                  " Javascript / Node.js

"  tab/space stops
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

augroup tabconf
    autocmd!
    autocmd Filetype yaml,html,css,htmldjango,javascript,markdown setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd Filetype rst setlocal tabstop=3 shiftwidth=3 softtabstop=3 expandtab
augroup END

" netrw is vim's built in file explorer. It's default appearance is ugly.
let g:netrw_banner=0

" What netrw_browse_split does
                " =0: re-using the same window  (default)
                " =1: horizontally splitting the window first
                " =2: vertically   splitting the window first
                " =3: open file in new tab
                " =4: act like "P" (ie. open previous window)
let g:netrw_browse_split=0

" netrw_liststyles:
    " 1: thin
    " 2: long
    " 3: wide
    " 4: tree
let g:netrw_liststyle = 3

" replace error bell with visual bell
set noerrorbells visualbell t_vb=

" Comments are bold
highlight Comment cterm=bold

" Aliases for git-fugitive commands
command! -nargs=0 Ga :Git add -A
command! -nargs=0 Gc :Git commit -v
command! -nargs=0 Gd :Git diff
command! -nargs=0 Gp :Git push
command! -nargs=0 Gdsp :Gdiff
command! -nargs=0 Gdsp :Gdiff
command! -nargs=0 Gdqf :Git difftool
