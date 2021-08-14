call plug#begin()
                            " GENERAL TOOLING
Plug 'tpope/vim-fugitive'                       " Git commands
Plug 'tpope/vim-sensible'                       " a universal set of defaults that (hopefully) everyone can agree on.
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
