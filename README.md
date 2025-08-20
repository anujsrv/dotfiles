# dotfiles
Essential dotfiles for setting up dev environment

# Requirements:
1. [neovim 0.10 and above](#neovim)
2. [fzf (fuzzy finder)](#fzf)
3. [ripgrep (Rg)](#Rg)
4. [bat (for syntax highlighting in fzf preview window)](#bat)

### neovim
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

### Rg
#### For centos
Follow instructions here: https://github.com/BurntSushi/ripgrep#installation to install version 0.5 and above

#### For macOs
```bash
brew install ripgrep
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
