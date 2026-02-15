-- Python provider for Neovim:
-- Prefer a dedicated venv on local machines; fall back to Codespaces system python.
local candidates = {
  vim.fn.expand("~/.venvs/nvim/bin/python"),      -- local mac/linux (recommended)
  "/usr/local/python/current/bin/python3",        -- codespaces
  "/opt/homebrew/bin/python3",                    -- homebrew python (fallback)
  "/usr/bin/python3",                             -- system python (last resort)
}

for _, p in ipairs(candidates) do
  if vim.fn.executable(p) == 1 then
    vim.g.python3_host_prog = p
    break
  end
end

-- Fetch plugins with Packer
require('plugins')

-- Bring in settings
require('settings.general')
require('settings.mappings')

-- Required:
vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')
