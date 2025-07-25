-- Key mappings
local keymap = vim.keymap.set

-- TAB in general mode will move to text buffer
keymap("n", "<TAB>", ":bnext<CR>", { silent = true })
keymap("n", "<S-TAB>", ":bprevious<CR>", { silent = true })

-- Close current buffer
keymap("n", "<leader>q", ":bd<CR>", { silent = true })

-- Alternative way to save
keymap("n", "<C-s>", ":w<CR>", { silent = true })

-- isort
keymap("n", "<leader>i", ":Isort<CR>", { silent = true })