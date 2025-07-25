-- Fetch plugins with Packer
require('plugins')

-- Bring in settings
require('settings.general')
require('settings.mappings')

-- Required:
vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')