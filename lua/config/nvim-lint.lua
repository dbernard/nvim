-- Confirm available
local ok, lint = pcall(require, "lint")
if not ok then
  return  -- plugin not available yet
end

lint.linters_by_ft = {
  python = { 'mypy', 'flake8' }
}

-- Auto-lint on save and text change
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})
