# remove greeting messsage
set -x fish_greeting

# vi mode
fish_vi_key_bindings

function fish_mode_prompt
end

# prompt
function fish_prompt
	if test "$fish_key_bindings" = "fish_vi_key_bindings"
		switch $fish_bind_mode
			case default
				set_color cyan white
			case insert
				set_color green white
			case replace-one
				set_color green white
			case visual
				set_color yellow white
			end
		echo (prompt_pwd) "> "
	end
end

# output git branch
function git_branch
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
end

# right side prompt
function fish_right_prompt
	set_color purple white
	echo (git_branch)
end

# alias
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias c="clear"
alias gpg="LANG=C gpg"
alias rm="rmtrash"

# neovim
set -gx XDG_CONFIG_HOME "$HOME/.config"
alias vi="nvim"

# coc
alias cocls="npm --prefix=$HOME/.config/coc/extensions/ list --depth=0"
alias cocin="npm --prefix=$HOME/.config/coc/extensions/ install"
alias cocrm="npm --prefix=$HOME/.config/coc/extensions/ remove"

# asdf
source ~/.asdf/asdf.fish
mkdir -p ~/.config/fish/completions; and cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions

# golang
set -gx GO111MODULE on
set -gx GOROOT "$HOME/.asdf/installs/golang/1.15/go"
set -gx GOPATH "$HOME/.go"
set -gx PATH "$GOPATH/bin" $PATH

# kubectl
set -gx KUBECONFIG "$HOME/.kube/kind-config-kind"
