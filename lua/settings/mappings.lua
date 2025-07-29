-- Key mappings
local keymap = vim.keymap.set

-- TAB in general mode will move to text buffer
-- Block bnext in terminal buffers to protect me from myself
keymap("n", "<Tab>", function()
  if vim.bo.buftype ~= "terminal" then
    vim.cmd("bnext")
  else
    vim.notify("Don't use :bnext in terminal windows", vim.log.levels.WARN)
  end
end, { silent = true })
keymap("n", "<S-TAB>", ":bprevious<CR>", { silent = true })

-- Close current buffer
keymap("n", "<leader>q", ":bd<CR>", { silent = true })

-- Alternative way to save
keymap("n", "<C-s>", ":w<CR>", { silent = true })

-- isort
keymap("n", "<leader>i", ":Isort<CR>", { silent = true })

-- Dashboard
keymap("n", "<leader>db", ":Dashboard<CR>", { silent = true })
