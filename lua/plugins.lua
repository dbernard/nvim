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

function get_setup(name)
  return function()
    require("settings." .. name)
  end
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  use 'joshdick/onedark.vim'
  use {
    'itchyny/lightline.vim',
    config = function() require("lightline") end
  }
  use {
    'folke/which-key.nvim',
    config = function() require("which_key") end
  }
  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf', run = ':call fzf#install()' },
    config = 'vim.cmd[[source $HOME/.config/nvim/settings/plug/fzf.vim]]'
  }
  use 'airblade/vim-rooter' -- Change vim's working dir for fzf
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require("plug-colorizer") end
  } -- Shows hex/rgb/etc colors
  use {
    'junegunn/rainbow_parentheses.vim',
    config = function() require("rainbow-parentheses") end
  }
  use 'mengelbrecht/lightline-bufferline' -- Open buffers add-on for lightline
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require("treesitter") end
  }
  use 'tpope/vim-fugitive' -- Git interface
  use 'fisadev/vim-isort' -- isort for Python
  use {
    'voldikss/vim-floaterm',
    config = function() require("floaterm") end
  } -- Terminal management
  use {
    'dense-analysis/ale',
    config = function() require("ale") end
  } -- Ale for async linting
  use 'nvim-lua/plenary.nvim' -- Telescope requirement
  use 'nvim-telescope/telescope.nvim' -- Fuzzy finder
  use 'kyazdani42/nvim-web-devicons' -- Devicons for Telescope
  use 'tpope/vim-commentary' -- Commenting across filetypes
  use {
    'SirVer/ultisnips',
    config = function() require("ultisnips") end
  } -- Snippets engine
  use 'honza/vim-snippets' -- Collection of snippets for UltiSnips

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
