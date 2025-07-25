vim.cmd("let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]")
vim.api.nvim_create_autocmd("VimEnter", { pattern = "*", command = "RainbowParentheses" })
