if &compatible
  set nocompatible               " Be iMproved
endif

let $DEIN_DIR = expand("$HOME/.config/nvim/dein")

" Required:
" set runtimepath+=/Users/dylan/.config/nvim/dein/repos/github.com/Shougo/dein.vim
exe 'set runtimepath+=' . expand("$DEIN_DIR/repos/github.com/Shougo/dein.vim")

" Required:
call dein#begin($DEIN_DIR)

" Let dein manage dein
" Required:
call dein#add('$DEIN_DIR/repos/github.com/Shougo/dein.vim')

" Plugins
call dein#add('joshdick/onedark.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('folke/which-key.nvim')
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
call dein#add('airblade/vim-rooter') " Change vim's working dir for fzf
call dein#add('norcalli/nvim-colorizer.lua') " Shows hex/rgb/etc colors
call dein#add('junegunn/rainbow_parentheses.vim')
call dein#add('mengelbrecht/lightline-bufferline') " Open buffers add-on for lightline
call dein#add('nvim-treesitter/nvim-treesitter')
call dein#add('tpope/vim-fugitive') " Git interface
call dein#add('fisadev/vim-isort') " isort for Python
call dein#add('voldikss/vim-floaterm') " Terminal management
call dein#add('dense-analysis/ale') " Ale for async linting
call dein#add('nvim-lua/plenary.nvim') " Telescope requirement
call dein#add('nvim-telescope/telescope.nvim') " Fuzzy finder
call dein#add('kyazdani42/nvim-web-devicons') " Devicons for Telescope
call dein#add('glepnir/dashboard-nvim') " Dashboard
call dein#add('tpope/vim-commentary') " Commenting across filetypes
call dein#add('SirVer/ultisnips') " Snippets engine
call dein#add('honza/vim-snippets') " Collection of snippets for UltiSnips

" Required:
call dein#end()

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif
