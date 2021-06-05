""""""""""""""""" My shortcuts and personal preferences """""""""""""""""""""""

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

" Cycle through buffers with <leader>n and <leader>N
nnoremap <silent> <leader>n :bn<cr>
nnoremap <silent> <leader>N :bp<cr>

" Cycle through quickfix list with <leader>c and <leader>C
nnoremap <silent> <leader>c :cn<cr>
nnoremap <silent> <leader>C :cp<cr>

" Delete buffer without closing window
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<cr>

" Input python docstring with <leader>d
nnoremap <leader>d o"""<cr><cr>"""<Esc>ki

" Input python breakpoint with <leader>b
nnoremap <leader>b obreakpoint()<Esc>

" Spell check in current buffer
nnoremap <silent> <leader>s :setlocal spell spelllang=en_us<CR>

" Terminal shortcuts
"
" <leader>t => open existing terminal in new tab
" <leader>T => open new terminal in new tab
" tt => open existing terminal in current window
nnoremap <silent> <leader>t :tabnew<CR>:buffer ter<Tab><CR>
nnoremap <silent> <leader>T :tabe +ter<CR>
nnoremap <silent> tt :buffer term<Tab><CR>

" Colorschemes (install these: https://github.com/flazz/vim-colorschemes)
" colorscheme Tomorrow
" colorscheme jitterbug
colorscheme Atelier_SulphurpoolDark

" E to enter netrw from normal mode
nnoremap E :E<cr>


"""""""""""""""""""" General purpose vim settings """"""""""""""""""""""""""""
"   You can get more info on all of these with :help ____, but I like having
"   the notes right here so you're not just copying stuff and having no idea
"   what it does without doing a vim-help-research-project.
set showtabline=2           " Always show file name at the top
syntax on                   " Enable syntax highlighting
set ttyfast                 " Optimize vim for a fast terminal connection; may degrade performance on unusually slow SSH connections
set nowrap                  " Do not wrap lines; not good for all files, but my preference!
set showcmd                 " Normal mode; show keys you pressed (bottom-right)
set exrc                    " allow plugins to execute .vimrc files
set secure                  " recommended to accompany 'set exrc'
set number relativenumber   " turn cursor-relative line numbering on
set path=$PWD/**5           " Update find path to search up to 5 subdirectories
set list                    " Display tabs and trailing whitespace
set colorcolumn=80          " Line length rulers at 80 and 100 characters
set hidden                  " Allow buffers to remain open in the background

" The next four settings completely prevent vim from backing your work up
" anywhere. If, like me, you type :w after basically every line you write,
" you'll be ok!
set nobackup
set nowritebackup
set noswapfile

set wildmenu                " Completion suggestions listed on <tab> press
set wildignore+=*.pyc,*.pyo,*/__pycache__/*     " Python
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
    autocmd Filetype yaml,html,css,htmldjango,javascript,make,txt,markdown setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
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

" Man page plugin which enables :Man command
runtime ftplugin/man.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" All that follows are plugins. They are managed by vim-plug, a package
" manager for vim plugins. To quickly setup vim on a remote machine, only
" copy everything above.
"
" For your local machine, first install vim-plug by following the instructions
" at https://github.com/junegunn/vim-plug. Then, after launching vim, run
" :PlugInstall
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()
                            " GENERAL TOOLING
Plug 'tpope/vim-fugitive'                       " Git commands
Plug 'tommcdo/vim-fugitive-blame-ext'           " Git blame extension
Plug 'tpope/vim-commentary'                     " Comment anything out with gc<movement>
Plug 'tpope/vim-sensible'                       " a universal set of defaults that (hopefully) everyone can agree on.

                            " JAVASCRIPT
Plug 'jelera/vim-javascript-syntax'             " syntax highlighting

" prettier auto-formatter
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
\}

                            " CSS & SCSS
Plug 'cakebaker/scss-syntax.vim'                " syntax highlighting


                            " PYTHON
Plug 'Vimjas/vim-python-pep8-indent'            " pep8 indenting
Plug 'vim-python/python-syntax'                 " syntax highlighting

call plug#end()
