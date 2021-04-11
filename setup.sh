#!/usr/bin/env bash

set -e

cat <<EOS
#####################################
# pre settings
#####################################
EOS

echo "# make workspace"
mkdir ~/Documents/workspace

echo "# install command line tools for xcode"
if [ ! -d /Library/Developer/CommandLineTools ]; then
	xcode-select --install
fi

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
	awscli
	gnupg
	rmtrash
)

brew install "${PACKAGES[@]}" || :

echo "# install apps"
APPS=(
	bitwarden
	brave-browser
	deepl
	docker
	drawio
	dropbox
	mailspring
	slack
	tor-browser
	twitch
	homebrew/cask-drivers/yubico-yubikey-manager
	zoomus
	zsa-wally
)

brew install --cask "${APPS[@]}" || :

cat <<EOS
#####################################
# git
#####################################
EOS

echo "# install"
brew install git

echo "# setup"
GITNAME=${1:-"grimoh"}
GITEMAIL=${2:-"dev@grimoh.net"}
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

git config --global ghq.root ~/Documents/workspace

cat <<EOS
#####################################
# setup
#####################################
EOS

echo "# get setup"
git clone https://github.com/grimoh/setup.git ~/.setup
setup=~/.setup

echo "# setup bash"
cd $setup/bash
bash setup.sh
. ~/.bashrc

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

echo "# install fisher plugins(fish-ghq, dracula, bass, fish-kubectl-cpmpletions, done, fzf, z)"
fish -C "fisher install decors/fish-ghq;and fisher install dracula/fish;and fisher install edc/bass;and fisher install evanlucas/fish-kubectl-completions;and fisher install franciscolourenco/done;and fisher install jethrokuan/fzf;and fisher install jethrokuan/z;"

echo "# setup"
cd $setup/fish
bash setup.sh
source ~/.bashrc

cat <<EOS
#####################################
# asdf
#####################################
EOS

echo "# install dependencies"
brew install coreutils

echo "# install if asdf is not installed"
if [ ! -d ~/.asdf ]; then
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf
fi

echo "# setup"
cd $setup/asdf
bash setup.sh
. ~/.asdf/asdf.sh
. ~/.asdf/completions/asdf.bash
asdf update

asdf plugin add act https://github.com/grimoh/asdf-act.git
asdf plugin add bitwarden
asdf plugin add fzf
asdf plugin add gcloud
asdf plugin add ghq
asdf plugin add gohugo
asdf plugin add golang
asdf plugin add jq
asdf plugin add kubectl
asdf plugin add neovim
asdf plugin add nodejs && bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf plugin add python
asdf plugin add ruby
asdf plugin add stern
asdf plugin add terraform
asdf plugin add yarn

echo "# install the asdf plugin version"
asdf install

cat <<EOS
#####################################
# neovim
#####################################
EOS

echo "# install dein"
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh installer.sh ~/.cache/dein
rm installer.sh

echo "# setup"
cd $setup/neovim
bash setup.sh

echo "# run neovim"
nvim

cd
rm -rf .setup
echo "# setup completed"
