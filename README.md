# dotfiles
---
Essential dotfiles for setting up dev environment

# Requirements:
---
1. [vim 8 and above](#vim-8-and-above)
2. [neovim 0.5 and above](#neovim-0.5-and-above)
3. [fzf (fuzzy finder)](#fzf)
4. [bat (for syntax highlighting in fzf preview window)](#bat)
### vim 8 and above
#### For centos
```bash
yum install gcc make ncurses ncurses-devel
sudo yum remove vim-enhanced vim-common vim-filesystem
sudo git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
--enable-multibyte \
--enable-rubyinterp \
--enable-pythoninterp \
--enable-luainterp \
--prefix=/usr
make
sudo make install
```
#### For macOs
```bash
brew upgrade vim
```
### neovim 0.5 and above
Follow instructions here - https://github.com/neovim/neovim/releases
### fzf
#### For centos
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
#### For macOs
```bash
brew install fzf
```
### bat
#### For centos
```bash
wget -O bat.tar.gz https://github.com/sharkdp/bat/releases/download/v0.15.0/bat-v0.15.0-x86_64-unknown-linux-musl.tar.gz
sudo tar -xvzf bat.tar.gz -C /usr/local
cd /usr/local && sudo mv bat-v0.7.1-x86_64-unknown-linux-musl bat
cd -

sudo ln -s /usr/local/bat/bat /usr/bin/bat
```
#### For macOs
```bash
brew install bat
```
