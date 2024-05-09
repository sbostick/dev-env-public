Install 'Plug' plugin manager and plugins
-----------------------------------------

```
curl -sSfL --create-dirs \
  -o "$HOME/.local/share/nvim/site/autoload/plug.vim" \
  "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

nvim +PlugInstall +PlugClean! +qall
```

Neovim Setup
------------

* iTerm2 3.4.15 via homebrew
* neovim v0.7.2

brew update
brew install ripgrep
brew install fd
brew upgrade
nvim +PlugInstall +PlugClean! +qall

### Telescope

:checkhealth telescope
\ff
\fg

### Ctrl-p

ctrl+p
