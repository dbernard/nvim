-- Confirm available
local ok, conform = pcall(require, "conform")
if not ok then
  return  -- plugin not available yet
end

conform.setup({
  formatters_by_ft = {
    python = { "black", "isort" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
