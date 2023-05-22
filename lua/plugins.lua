-- Install packer if it doesn't already exist
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Automatially run PackerCompile when plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  use 'joshdick/onedark.vim'
  use 'itchyny/lightline.vim'
  use 'folke/which-key.nvim'
  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf', run = ':call fzf#install()' }
  }
  use 'airblade/vim-rooter' -- Change vim's working dir for fzf
  use 'norcalli/nvim-colorizer.lua' -- Shows hex/rgb/etc colors
  use 'junegunn/rainbow_parentheses.vim'
  use 'mengelbrecht/lightline-bufferline' -- Open buffers add-on for lightline
  use 'nvim-treesitter/nvim-treesitter'
  use 'tpope/vim-fugitive' -- Git interface
  use 'fisadev/vim-isort' -- isort for Python
  use 'voldikss/vim-floaterm' -- Terminal management
  use 'dense-analysis/ale' -- Ale for async linting
  use 'nvim-lua/plenary.nvim' -- Telescope requirement
  use 'nvim-telescope/telescope.nvim' -- Fuzzy finder
  use 'kyazdani42/nvim-web-devicons' -- Devicons for Telescope
  use 'glepnir/dashboard-nvim' -- Dashboard
  use 'tpope/vim-commentary' -- Commenting across filetypes
  use 'SirVer/ultisnips' -- Snippets engine
  use 'honza/vim-snippets' -- Collection of snippets for UltiSnips

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
