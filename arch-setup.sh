#!/bin/sh

sudo pacman -S base-devel git htop firefox \
    tmux neovim python3 zsh python-pip \
    nodejs npm \
    zsh-autosuggestions ctags \
    jq fd tcpdump \
    ccls wireguard-tools resolvconf man \
    gdb libpcap

git clone https://github.com/collinsrhuffiii/dotfiles.git
ssh-keygen -t ed25519 -C "collinsrhuffiii@gmail.com"
cat /home/ch/.ssh/id_ed25519.pub

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

pip3 install neovim

chsh -s /usr/bin/zsh

rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.config/nvim 2> /dev/null
mkdir -p ~/.config ~/.config/nvim
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.config/nvim/init.vim

ln -s /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh .zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

mkdir src
cd src
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~

mkdir ~/go


curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install eva exa hexyl ripgrep skim
