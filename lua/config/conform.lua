-- Formatting with conform.nvim
local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    python = { "black", "isort" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})