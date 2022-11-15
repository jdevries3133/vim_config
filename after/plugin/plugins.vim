" Aliases for git-fugitive commands
command! -nargs=0 Glg :Git log --stat
command! -nargs=0 Ga :Git add -A
command! -nargs=0 Gc :Git commit -v
command! -nargs=0 Gcs :Git commit -v --no-verify
command! -nargs=0 Gd :Git diff
command! -nargs=0 Gp :Git push
command! -nargs=0 Gcap :Git commit --amend --no-edit --no-verify

" Format the file or visual selection with prettier
vnoremap <leader>p :%!prettier --stdin-filepath %<CR>

" Format the whole file with prettier
command! -nargs=0 Prettier :w<bar>:!prettier -w %
