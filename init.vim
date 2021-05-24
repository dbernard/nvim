" Bring in settings
source $HOME/.config/nvim/settings/plugins.vim
source $HOME/.config/nvim/settings/general.vim
source $HOME/.config/nvim/settings/mappings.vim
source $HOME/.config/nvim/settings/plug/fzf.vim
source $HOME/.config/nvim/settings/plug/rainbow_parentheses.vim
" Lua
luafile $HOME/.config/nvim/lua/plug-colorizer.lua

" Required:
filetype plugin indent on
syntax enable
