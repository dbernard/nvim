local ok, cmp = pcall(require, "cmp")
if not ok then
  return
end

-- Global variable to track completion state (disabled by default)
vim.g.cmp_enabled = false

-- Function to toggle completion
local function toggle_completion()
  vim.g.cmp_enabled = not vim.g.cmp_enabled
  if vim.g.cmp_enabled then
    cmp.setup.buffer({ enabled = true })
    print("Completion enabled")
  else
    cmp.setup.buffer({ enabled = false })
    print("Completion disabled")
  end
end

-- Make toggle function globally available
vim.api.nvim_create_user_command('CmpToggle', toggle_completion, {})

cmp.setup({
  enabled = function()
    return vim.g.cmp_enabled
  end,
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})

-- Command line completion (always enabled)
cmp.setup.cmdline({ '/', '?' }, {
  enabled = true,
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  enabled = true,
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})