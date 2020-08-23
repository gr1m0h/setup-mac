set -x fish_greeting

# alias
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias vi="nvim"
alias k="kubectl"
alias c="clear"

# coc
alias cocls="npm --prefix=$HOME/.config/coc/extensions/ list --depth=0"
alias cocin="npm --prefix=$HOME/.config/coc/extensions/ install"
alias cocrm="npm --prefix=$HOME/.config/coc/extensions/ remove"
