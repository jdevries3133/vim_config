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

" Make 'Y' act like 'D' and 'C', yanking the remainder of the line from the
" cursor to the end.
nnoremap Y y$

" Convert selected text in visual mode to hex with ";"
vnoremap ; :<c-u>s/\%V./\=printf("%x",char2nr(submatch(0)))/g<cr><c-l>`<

" Cycle through buffers with <leader>n and <leader>N
nnoremap <silent> <leader>n :bnext<cr>
nnoremap <silent> <leader>N :bprevious<cr>

" Cycle through quickfix list with <leader>c and <leader>C
nnoremap <silent> <leader>c :cnext<cr>zz
nnoremap <silent> <leader>C :cprevious<cr>zz

" Vertically center the cursor with `zz` while cycling through search results
nnoremap n nzz
nnoremap N Nzz

" Delete buffer without closing window
nnoremap <leader>q :bprevious<bar>split<bar>bnext<bar>bdelete<cr>

" Input python docstring with <leader>d
nnoremap <leader>d o""""""<Esc>hhi

" Input python breakpoint with <leader>b
nnoremap <leader>b obreakpoint()<Esc>

" Spell check in current buffer
nnoremap <silent> <leader>s :setlocal spell spelllang=en_us<CR>
nnoremap <silent> <leader>S :setlocal nospell<CR>

" Syntax fold, for C-like languages
nnoremap <silent> <leader>Fs :set foldmethod=syntax<CR>

" Indent fold for python
nnoremap <silent> <leader>Fi :set foldmethod=indent<CR>

" 'Fold none': open all folds
nnoremap <silent> <leader>Fn :set foldmethod=manual<CR>zR

" Terminal emulator shortcuts
"
" <leader>t => open *existing* terminal in new tab
" <leader>T => open new terminal in new tab
" tt => jump to existing terminal in current window
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
"   the notes right here so others can just copy stuff and know what it does
"   without doing a vim-help-research-project.
"
set showtabline=2           " always show file name at the top
syntax on                   " enable syntax highlighting
set nowrap                  " do not wrap lines
set showcmd                 " normal mode; show keys you pressed (bottom-right)
set exrc                    " allow plugins to execute .vimrc files
set secure                  " recommended to accompany 'set exrc'
set number relativenumber   " turn cursor-relative line numbering on
set path+=,$PWD/**          " :find and similar searchs recursively down
set list                    " make tabs and trailing whitespace visible
set wildmenu                " enables tab-complete list in command mode
set lazyredraw              " do not re-draw while executing macros
set colorcolumn=80          " ruler at 80 chars
set cursorline              " highlight the line that the cursor is on

" The next four settings completely prevent vim from backing your work up
" anywhere. These backups can cause bugs for many plugins, clutter your
" working directory, and act as a nuisance. Just save your work!
set hidden
set nobackup
set nowritebackup
set noswapfile

" The wildmenu is the tab-complete list in command mode, for auto-completing
" commands and file paths. When doing the latter, it will ignore these
" patterns.
set wildignore+=*.pyc,*.pyo,*/__pycache__/*     " Python
set wildignore+=*.o,*.ko,*.obj,*.dSYM           " C
set wildignore+=*.swp,~*                        " Temp files
set wildignore+=*.zip,*.tar                     " Archives
set wildignore+=node_modules/*                  " Javascript / Node.js

"  default tab/space stops of 4 spaces, overrided for sime filetypes below
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

augroup tabconf
    autocmd!

    " 2-space tab languages
    autocmd Filetype
\       yaml,html,css,htmldjango,javascript,javascriptreact,typescript,typescriptreact,markdown,terraform
\       setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

    " 3-space tab languages (why, reStructured text, why?!?)
    autocmd Filetype rst setlocal tabstop=3 shiftwidth=3 softtabstop=3 expandtab
augroup END


augroup markdown
    " Detect MDX files as markdown
    autocmd BufNewFile,BufRead *.mdx set filetype=markdown

    " Set textwidth to 80 chars
    autocmd Filetype markdown setlocal textwidth=80

augroup END


" netrw is vim's built in file explorer, and has a huge banner consuming 2/3
" of the vertical screen space by default.
let g:netrw_banner=0

" netrw_browse_split options:
"   0: re-using the same window  (default)
"   1: horizontally splitting the window first
"   2: vertically   splitting the window first
"   3: open file in new tab
"   4: open in previous window (very IDE-like)
let g:netrw_browse_split=0

" netrw list styles:
"   1: thin
"   2: long
"   3: wide
"   4: tree
let g:netrw_liststyle = 3

" replace error bell with visual bell
set noerrorbells visualbell t_vb=

" Comments are bold
highlight Comment cterm=bold

" built-in macro for html tag matching with %
runtime macros/matchit.vim

" Aliases for git-fugitive commands
command! -nargs=0 Ga :Git add -A
command! -nargs=0 Gc :Git commit -v
command! -nargs=0 Gd :Git diff
command! -nargs=0 Gp :Git push
command! -nargs=0 Gdsp :Gdiff
command! -nargs=0 Gdsp :Gdiff
command! -nargs=0 Gdqf :Git difftool
