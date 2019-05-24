#!/usr/bin/env bash

set -e

cat <<EOS
#####################################
# pre settings
#####################################
EOS

echo "# install command line tools for xcode"
xcode-select --install

echo "# mkdir neovim plugin dir ~/.cache/dein"
mkdir -p ~/.cache/dein

cat <<EOS
#####################################
# brew
#####################################
EOS

echo "# install if homebrew is not installed"
if ! ( type "brew" > /dev/null 2>&1 ); then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "# install packages"
PACKAGES=(
	ccat
	coreutils
	autoconf
	automake
	coreutils
	libtool
	libyaml
	openssl
	readline
	unixodbc
	gpg
	zlib
	gometalinter
)

brew install "${PACKAGES[@]}" || :

cat <<EOS
#####################################
# git
#####################################
EOS

echo "# install"
brew install git

echo "# setup"
GITNAME=${1:-"grimoh117"}
GITEMAIL=${2:-"email@grimoh.com"}
git config --global user.name "${GITNAME}"
git config --global user.email "${GITEMAIL}"

git config --global core.editor 'nvim -c "set fenc=utf-8"'
git config --global core.diff auto
git config --global core.status auto
git config --global core.branch auto

git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global color.ui true

cat <<EOS
#####################################
# dotfiles
#####################################
EOS

echo "# get dotfiles"
git clone https://github.com/grimoh117/dotfiles.git ~/.dotfiles
dotfiles=~/.dotfiles

echo "# setup bash"
cd $dotfiles/bash
bash setup.sh
. ~/.bashrc

cat <<EOS
#####################################
# asdf
#####################################
EOS

echo "# install if asdf is not installed"
if [ ! -d ~/.asdf ]; then
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf
fi

echo "# setup"
cd $dotfiles/asdf
bash setup.sh
. ~/.asdf/asdf.sh
. ~/.asdf/completions/asdf.bash
asdf update

echo "# add plugins(golang, python, nodejs, terraform, kubectl, kubectx, jq)"
asdf plugin-add golang
asdf plugin-add python
asdf plugin-add nodejs && bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf plugin-add terraform
asdf plugin-add kubectl
asdf plugin-add kubectx https://github.com/virtualstaticvoid/asdf-kubectx.git
asdf plugin-add jq https://github.com/ryodocx/asdf-jq.git

echo "# install the asdf plugin version"
asdf install

cat <<EOS
#####################################
# neovim
#####################################
EOS

echo "# install"
brew install neovim

echo "# install dein"
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh installer.sh ~/.cache/dein
rm installer.sh

echo "# setup"
cd $dotfiles/neovim
bash setup.sh

echo "# run neovim"
nvim

cat <<EOS
#####################################
# fish
#####################################
EOS

echo "# install"
brew install fish

echo "# install if fisher is not installed"
if ! ( type "fisher" > /dev/null 2>&1 ); then
	curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fi

echo "# install powerline font"
git clone https://github.com/powerline/fonts.git --depth=1
sh fonts/install.sh
rm -rf fonts

echo "# install fisher plugins(bobthefish, bass)"
fish -C "fisher add oh-my-fish/theme-bobthefish;and fisher add edc/bass;and fisher add jethrokuan/z"

echo "# setup"
cd $dotfiles/fish
bash setup.sh
source ~/.bashrc

cd
rm -rf .dotfiles
echo "# setup completed"
