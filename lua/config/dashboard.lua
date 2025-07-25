local dashboard = require("dashboard")

dashboard.setup({
  theme = 'hyper',
  config = {
    week_header = {
      enable = true,
    },
    shortcut = {
      { desc = '󰊳 Update', group = '@property', action = 'PackerSync', key = 'u' },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        desc = ' Recent',
        group = 'DiagnosticHint',
        action = 'Telescope oldfiles',
        key = 'r',
      },
      {
        desc = ' Config',
        group = 'Number',
        action = 'edit ~/.config/nvim/init.lua',
        key = 'c',
      },
    },
    packages = { enable = true },
    project = { enable = true, limit = 8, icon = ' ', label = '', action = 'Telescope find_files cwd=' },
    mru = { enable = true, limit = 10, icon = ' ', label = '', cwd_only = false },
    footer = {}
  }
})

-- Auto open dashboard on startup
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd('Dashboard')
    end
  end
})

-- Disable unwanted features for dashboard
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'dashboard',
  callback = function()
    vim.opt_local.foldenable = false
    vim.opt_local.colorcolumn = '0'
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'
  end
})