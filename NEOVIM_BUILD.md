Nightly Builds
--------------

Nightly builds are available for MacOS.

```bash
curl -L -o /tmp/nvim-macos.tar.gz \
     https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
tar -C /opt -xzf /tmp/nvim-macos.tar.gz
export PATH="$PATH:/opt/nvim-macos/bin"
```


Local Build
-----------

*Ubuntu22.04 provides nvim 0.6; telescope not supported*

```
apt-get update
apt-get install -y ripgrep fd-find curl git tree file vim
apt-get remove -y neovim  # version too old; build from source instead

apt-get install ninja-build gettext libtool libtool-bin autoconf \
     automake cmake g++ pkg-config unzip curl doxygen python3-pip htop
pip install cmake

git clone https://github.com/neovim/neovim /tmp/neovim
cd /tmp/neovim && git checkout v0.7.2

make clean distclean
sudo rm /usr/local/bin/nvim
sudo rm -r /usr/local/share/nvim/
time make cmake_build_type=release
sudo make install
```

*Fedora*

```
sudo dnf update
sudo dnf install -y ripgrep fd-find
sudo dnf install -y curl git tree file vim
sudo dnf remove -y neovim  # version too old; build from source instead

sudo yum -y install ninja-build libtool autoconf automake cmake gcc gcc-c++ \
                    make pkgconfig unzip patch gettext curl

git clone https://github.com/neovim/neovim /tmp/neovim
cd /tmp/neovim && git checkout v0.7.2

make clean distclean
sudo rm /usr/local/bin/nvim
sudo rm -r /usr/local/share/nvim/
time make cmake_build_type=release
sudo make install
```
