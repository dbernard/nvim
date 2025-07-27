-- Confirm available
if vim.fn.exists(":RainbowParentheses") == 0 then
  return
end

vim.cmd("let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]")
vim.api.nvim_create_autocmd("VimEnter", { pattern = "*", command = "RainbowParentheses" })
