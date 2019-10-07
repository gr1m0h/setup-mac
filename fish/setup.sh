#!/usr/bin/env bash
cp -p config.fish ~/.config/fish/
cp -p starship.toml ~/.config/
echo -e "# use fish\nexec fish\n" >> ~/.bashrc
