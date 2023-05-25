"
" This is compatible with vim and neovim and makes no reference to any
" plugins. Great for copying over to a remote machine as your vimrc to provide
" a basic level of comfort via this bash snippet
"
" curl https://raw.githubusercontent.com/jdevries3133/vim_config/main/common.vim -o $HOME/.vimrc
"                                        |
"                                        ^ change the URL if you forked!!

"""""""""""""""" My shortcuts and personal preferences """""""""""""""""""""""

" In no particular order, these are some of the questionable and undoubtedly
" personal things that are implemented here:
"
" - `jk` is mapped to `<Esc>` in both insert and terminal modes
" - `Y` is mapped to `y$` so that `Y` behaves like `D` and `C`
" - `T` opens a new tab
" - `<leader>c` and `<leader>C` go forwards/backwards through the quickfix list
" - `<leader>q` close buffer without affecting window layout
" - `tt` jumps to the terminal buffer (or whatever buffer starts with `ter`)
" - `0` jumps back to the first non-whitespace character instead of all the way
"   back to the beginning of the line

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

" Cycle through quickfix list with <leader>c and <leader>C
" `zz` centers the cursor on the screen
nnoremap <silent> <leader>c :cnext<cr>zz
nnoremap <silent> <leader>C :cprevious<cr>zz

" Vertically center the cursor with `zz` while cycling through search results
nnoremap n nzz
nnoremap N Nzz

" Delete the current buffer without changing window layout
nnoremap <leader>q :bprevious<bar>split<bar>bnext<bar>bdelete<cr>

" Terminal emulator shortcuts
"
" <leader>T => open new terminal in new tab
" tt => jump to existing terminal in current window
nnoremap <silent> tt :buffer term<Tab><CR>

" Open a new tab
nnoremap T :tabnew<cr>
nnoremap <leader>T :tabnew<cr><bar>:terminal<cr>

"""""""""""""""""""" General purpose vim settings """"""""""""""""""""""""""""
"
" You can get more info on all of these with :help ____, but I like having the
" notes right here so others can just copy stuff and know what it does without
" doing a vim-help-research-project.
"
" These are generally less-controversial settings compared to the section
" above.

syntax on                   " enable syntax highlighting
set ttyfast                 " tell vim this isn't a 1995 dial-up remote terminal
set showtabline=2           " always show file name at the top
set nowrap                  " do not wrap lines
set showcmd                 " in normal mode show keys you pressed (bottom-right)
set exrc                    " allow plugins to execute .vimrc files
set secure                  " recommended to accompany 'set exrc'
set number                  " show line numbers
set relativenumber          " line numbers above & below cursor are relative
set incsearch               " jump to closest match during searching
set list                    " show non-printable characters as follows
set listchars=tab:»\        " 'real' tabs appear as '»'
set listchars+=extends:›    " super long lines like this end with › I'll show youuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
set listchars+=precedes:‹   " go to the end of the line above, it starts with ‹
set listchars+=nbsp:␣       " &nbsp becomes ␣
set listchars+=trail:·      " trailing whitespace becomes                     
set showbreak=↪\            " if wrapping is on, wrapped lines start with ↪
set wildmenu                " enables tab-complete list in command mode
set lazyredraw              " do not re-draw while executing macros
set colorcolumn=80          " ruler at 80 chars
set nofixendofline          " do not restore EOL at end of file when missing
set nosmartindent           " thank you Lawrence

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

"  default tab/space stops of 4 spaces, overrided for some filetypes below
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

augroup tabconf

    " 2-space tab languages
    autocmd Filetype
\       yaml,html,css,htmldjango,javascript,javascriptreact,typescript,typescriptreact,markdown,terraform,dart,lua,hcl
\       setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

    " 3-space tab languages (why, reStructured text, why?!?)
    autocmd Filetype rst setlocal tabstop=3 shiftwidth=3 softtabstop=3 expandtab
augroup END


augroup markdown
    " Detect MDX files as markdown
    autocmd BufNewFile,BufRead *.mdx set filetype=markdown

    " Set textwidth to 80 chars
    " The `pr` filetype is used by `gh.nvim`
    autocmd Filetype markdown,smgl,pr setlocal textwidth=79 spell

    " Wrap text for markdown
    autocmd Filetype markdown,smgl setlocal wrap

augroup END


augroup rust
    autocmd BufNewFile,BufRead *.rs nnoremap <leader>ct :!cargo test<CR>
augroup END


" netrw is vim's built in file explorer, and has a huge banner consuming 2/3
" of the vertical screen space by default. This disables it.
let g:netrw_banner = 0

"   0: re-using the same window  (default)
"   1: horizontally splitting the window first
"   2: vertically   splitting the window first
"   3: open file in new tab
"   4: open in previous window (very IDE-like)
let g:netrw_browse_split = 0

" netrw list styles:
"   1: thin
"   2: long
"   3: wide
"   4: tree
let g:netrw_liststyle = 3

" This differs from the default such that we will show line numbers
let g:netrw_bufsettings = 'nofile nomagic nomodifiable nowrap readonly nobuflisted'
autocmd FileType netrw setlocal bufhidden=delete


" built-in macro for xml/html tag matching with %
runtime macros/matchit.vim

" see https://jackdevries.com/post/vimRipgrep
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
