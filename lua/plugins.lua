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
  use {
    'navarasu/onedark.nvim',
    config = function() require('onedark').load() end
  }
  use 'kyazdani42/nvim-web-devicons' -- Devicons for Telescope, etc.
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function() require("config.plug_lualine") end
  }
  use {
    'folke/which-key.nvim',
    config = function() require("config.which_key") end
  }
  use {
    'junegunn/fzf.vim',
    requires = { 'junegunn/fzf', run = ':call fzf#install()' },
    config = function() require("config.fzf") end
  }
  use 'airblade/vim-rooter' -- Change vim's working dir for fzf
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require("config.plug-colorizer") end
  } -- Shows hex/rgb/etc colors
  use {
    'junegunn/rainbow_parentheses.vim',
    config = function() require("config.rainbow-parentheses") end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function() require("config.treesitter") end
  }
  use 'tpope/vim-fugitive' -- Git interface
  use 'fisadev/vim-isort' -- isort for Python
  use {
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = function() require("config.toggleterm") end
  } -- Terminal management
  use {
    'neovim/nvim-lspconfig',
    config = function() require("config.lspconfig") end
  } -- Native LSP configuration
  use {
    'stevearc/conform.nvim',
    config = function() require("config.conform") end
  } -- Modern formatting
  use {
    'mfussenegger/nvim-lint',
    config = function() require("config.nvim-lint") end
  } -- Linting via nvim-lint
  use 'nvim-lua/plenary.nvim' -- Telescope requirement
  use {
    'nvim-telescope/telescope.nvim', -- Fuzzy finder
    config = function() require("config.telescope-config") end
  }
    use 'tpope/vim-commentary' -- Commenting across filetypes
  use {
    'L3MON4D3/LuaSnip',
    config = function() require("config.luasnip") end
  } -- Lua-native snippets engine
  use {
    'ojroques/nvim-osc52',
    config = function() require("config.plug-osc52") end
  } -- Allow system clipboard access via SSH
  use {
    'MeanderingProgrammer/render-markdown.nvim',
    after = { 'nvim-treesitter' },
    -- requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
    -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
    -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
    config = function() require('render-markdown').setup({}) end
  }
  use 'github/copilot.vim' -- Github Copilot
  use {
    'nvimdev/dashboard-nvim',
    config = function() require("config.dashboard") end
  } -- Dashboard startup screen

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
