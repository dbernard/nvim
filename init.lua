-- Use system Python 3 for Neovim
-- This is a hack for my current codespace environment setup. Codespaces pull
-- in my Neovim config before virtualenv configuration, so pynvim gets installed
-- to the system Python 3.
local system_python = '/usr/local/python/current/bin/python3'
if vim.fn.executable(system_python) == 1 then
  vim.g.python3_host_prog = system_python
end

-- Fetch plugins with Packer
require('plugins')

-- Bring in settings
require('settings.general')
require('settings.mappings')

-- Required:
vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')
