-- Customize Ale
vim.g.ale_sign_error = ''
vim.g.ale_sign_warning = ''
vim.g.ale_lint_on_enter = 0

-- Linters
vim.g.ale_linters = { python = { 'flake8', 'mypy' } }

-- Fixers
vim.g.ale_fixers = { python = { 'remove_trailing_lines', 'trim_whitespace' } }
vim.g.ale_fix_on_save = 1

-- Key mappings
vim.api.nvim_set_keymap(
  "n",
  "<C-k>",
  "<Plug>(ale_previous_wrap)",
  { silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<C-j>",
  "<Plug>(ale_next_wrap)",
  { silent = true }
)
