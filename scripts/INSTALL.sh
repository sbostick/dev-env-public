#!/bin/bash
# COPIES DEV-ENV FILES TO HOME DIRECTORY.
# OVERWRITES EXISTING FILES.
set -eux

function os_name {
  uname | awk '{print tolower($0)}' | sed -e 's/darwin/macos/'
}

############################################################
#                        Main                              #
############################################################

#install -m 600 ./templates/$(os_name)/bashrc $HOME/.bashrc
install -m 600 ./templates/$(os_name)/zshrc $HOME/.zshrc
install -m 600 ./templates/common/inputrc $HOME/.inputrc
install -m 600 ./templates/common/terraformrc $HOME/.terraformrc
install -m 600 ./templates/common/tmux.conf $HOME/.tmux.conf
install -m 600 ./templates/common/gitconfig $HOME/.gitconfig
install -m 600 ./templates/common/gitignore $HOME/.config/git/ignore
install -m 600 ./templates/common/profile $HOME/.profile
install -m 600 ./templates/common/prompt $HOME/.prompt
install -m 600 ./templates/common/ripgreprc $HOME/.ripgreprc

# NeoVim config (nvim)
# (brew install neovim)
# (apt-get install neovim)
# Remember to install https://github.com/junegunn/vim-plug
# Remember to :PlugInstall
install -d -m 700 $HOME/.config/nvim/
install -d -m 700 $HOME/.vim/syntax
install -m 600 ./templates/.config/nvim/.vimrc $HOME/.config/nvim/.vimrc
install -m 600 ./templates/.config/nvim/init.vim $HOME/.config/nvim/init.vim
install -m 600 ./templates/.config/nvim/syntax/confluencewiki.vim $HOME/.vim/syntax/
install -m 600 ./templates/.config/nvim/syntax/openvpn.vim $HOME/.vim/syntax/
install -m 600 ./templates/.config/starship.toml $HOME/.config/starship.toml

# httpie
# https://httpie.io/docs/cli/config-file-directory
install -d -m 700 $HOME/.config/httpie/
install -m 600 ./templates/.config/httpie/config.json $HOME/.config/httpie/config.json

# SSH config
install -d -m 700 $HOME/.ssh/
install -m 600 ./templates/$(os_name)/user.ssh.config $HOME/.ssh/config

# Copy scripts to ~/bin/
install -m 700 ./scripts/* $HOME/bin/
rm -f $HOME/bin/INSTALL.sh

echo "$0 ran to completion."
