My vim configuration. This is really easy to setup, just clone it into
`~/.vim` on your system, install
[Vim-Plug](https://github.com/junegunn/vim-plug) as a plugin manager, and
finally install all the plugins with the `:PlugInstall` command.

There are very few plugins because I like to keep my vim config minimal:

- [vim-fugitive](https://github.com/tpope/vim-fugitive)
- [vim-sensible](https://github.com/tpope/vim-sensible)
- [vim-commentary](https://github.com/tpope/vim-commentary)
- [vim-colorschemes](https://github.com/flazz/vim-colorschemes)
- [vim-python-pep8-indent](https://github.com/Vimjas/vim-python-pep8-indent)

[My nvim configuration](https://github.com/jdevries3133/nvim_config/) extends
this configuration, and is much more IDE-like if that is your cup of tea.

### `common.vim`

`common.vim` is kind of my personal "vim-sensible." It is compatible between
vim and neovim and makes no reference to plugins. It makes a great `.vimrc` for
remote servers:

```bash
curl -o $HOME/.vimrc https://raw.githubusercontent.com/jdevries3133/vim_config/main/common.vim
#                                                      |
#                                         change the URL if you forked!!
```

