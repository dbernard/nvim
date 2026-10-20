-- Confirm available
local ok, lint = pcall(require, "lint")
if not ok then
  return  -- plugin not available yet
end

lint.linters_by_ft = {
  python = { 'mypy', 'flake8' }
}

-- Auto-lint on read, save and leaving insert; skip linters that aren't installed
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  callback = function()
    local names = vim.tbl_filter(function(name)
      local linter = lint.linters[name]
      if type(linter) == "function" then
        linter = linter()
      end
      local cmd = linter.cmd
      return vim.fn.executable(type(cmd) == "function" and cmd() or cmd) == 1
    end, lint.linters_by_ft[vim.bo.filetype] or {})
    lint.try_lint(names)
  end,
})
