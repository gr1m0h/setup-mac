#!/usr/bin/env bash
path=~/.config/nvim
user=${1:-"grimoh117"}

if [ ! -e $path ]; then
	echo "create dir $path"
	mkdir -p $path
fi

cp -p *.toml $path/
cp -p init.vim $path/
cp -r plugins $path/plugins

grep -l "<YOUR_NAME>" $path/init.vim  | xargs sed -i.bak -e "s/<YOUR_NAME>/$user/g"
echo -e "# neovim\nset -gx XDG_CONFIG_HOME $HOME/.config\nalias vi=\"nvim\"" >> ~/.config/fish/config.fish
echo -e "# coc\nalias cocls=\"npm --prefix=$HOME/.config/coc/extensions/ list --depth=0\"\nalias cocin=\"npm --prefix=$HOME/.config/coc/extensions/ install\"\nalias cocrm=\"npm --prefix=$HOME/.config/coc/extensions/ remove\"" >> ~/.config/fish/config.fish
