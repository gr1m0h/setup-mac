#!/usr/bin/env bash
goversion=${1:-"1.14.6"}
cp -p tool-versions ~/.tool-versions
echo -e "# asdf-vm\nsource ~/.asdf/asdf.fish\nmkdir -p ~/.config/fish/completions; and cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions\n" >> ~/.bashrc
