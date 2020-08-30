#!/usr/bin/env bash
cp -p tool-versions ~/.tool-versions
echo -e "# asdf-vm\nsource ~/.asdf/asdf.fish\nmkdir -p ~/.config/fish/completions; and cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions\n" >> ~/.config/fish/config.fish
