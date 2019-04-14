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

set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac

set number
set wrap

set noexpandtab
set tabstop=4
set shiftwidth=4
set autoindent
set hls

set noswapfile
set nobackup
set noundofile

set clipboard=unnamed
set shortmess+=I

imap { {}<LEFT>
imap ( ()<LEFT>
imap [ []<LEFT>
