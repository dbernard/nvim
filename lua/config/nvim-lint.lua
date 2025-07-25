-- Linting with nvim-lint
local lint = require('lint')

lint.linters_by_ft = {
  python = { 'mypy', 'flake8' }
}

-- Auto-lint on save and text change
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})