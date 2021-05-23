if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/dylan/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/dylan/.config/nvim/dein')

" Let dein manage dein
" Required:
call dein#add('/Users/dylan/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
call dein#add('joshdick/onedark.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('folke/which-key.nvim')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
" Change vim's working dir for fzf
call dein#add('airblade/vim-rooter')
call dein#add('norcalli/nvim-colorizer.lua')
call dein#add('junegunn/rainbow_parentheses.vim')

" Required:
call dein#end()

" Bring in settings
source $HOME/.config/nvim/settings/general.vim
source $HOME/.config/nvim/settings/mappings.vim
source $HOME/.config/nvim/settings/plug/fzf.vim
source $HOME/.config/nvim/settings/plug/rainbow_parentheses.vim
" Lua
luafile $HOME/.config/nvim/lua/plug-colorizer.lua

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif
