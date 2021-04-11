"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

set runtimepath+=/Users/<YOUR_NAME>/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
	call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
	call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

se encoding=utf-8
scriptencoding utf-8
se fileencoding=utf-8
se fileencodings=ucs-boms,utf-8,euc-jp,cp932
se fileformats=unix,dos,mac

" set colorscheme
colorscheme dracula

se number
se wrap

se noexpandtab
se tabstop=4
se shiftwidth=4
se autoindent
se smartindent
" se mouse=a
se cursorline
se hlsearch
se wildmenu

se noswapfile
se nobackup
se noundofile

se clipboard=unnamed
se shortmess+=I

let g:python3_host_prog = '$HOME/.asdf/shims/python3'
