#!/usr/bin/env bash
cp -p starship.toml ~/.config/
echo -e "# starship\neval (starship init fish)\n" >> ~/.config/fish/config.fish
