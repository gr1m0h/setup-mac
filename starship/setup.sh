#!/usr/bin/env bash
cp -p starship.toml ~/.config/
echo -e "# starship\nstarship init fish | source\n" >> ~/.config/fish/config.fish
