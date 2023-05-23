vim.cmd("let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]")
vim.api.nvim_create_autocmd("FileType", { pattern = "*", command = "RainbowParentheses" })
