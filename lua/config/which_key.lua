local ok, wk = pcall(require, "which-key")

if not ok then
  return
end

-- Setup which-key
wk.setup({
  -- Add any setup configuration here if needed
})

-- Load Telescope builtin functions
local builtin = require('telescope.builtin')

wk.add({
    -- finder (FZF)
    { "<leader>f", group = "finder" },
    { "<leader>ff", builtin.find_files, desc = "Find Files" },
    { "<leader>fg", builtin.live_grep, desc = "Live Grep" },
    { "<leader>fb", "<cmd>Buffers<cr>", desc = "Search Buffers" },
    { "<leader>fm", "<cmd>Marks<cr>", desc = "Search Marks" },
    { "<leader>fh", "<cmd>RG<cr>", desc = "Advanced Ripgrep" },
    { "<leader>fo", function() require("conform").format({ async = true, lsp_fallback = true }) end, desc = "Format File" },
    -- git
    { "<leader>g", group = "git" },
    { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git Blame" },
    { "<leader>gd", "<cmd>Git diff<cr>", desc = "Git Diff" },
    { "<leader>gl", "<cmd>Gclog -10<cr>", desc = "Git log (limit: 10)" },
    { "<leader>gs", "<cmd>Git st<cr>", desc = "Git Status" },
    -- session
    { "<leader>s", group = "session" },
    { "<leader>sl", "<cmd>SessionLoad<cr>", desc = "Session Load" },
    { "<leader>ss", "<cmd>SessionSave<cr>", desc = "Session Save" },
    -- floaterm
    { "<leader>t", group = "terminal" },
    { "<leader>tf", "<cmd>FloatermNew fzf<cr>", desc = "fzf Terminal" },
    { "<leader>th", "<cmd>FloatermHide!<cr>", desc = "Hide Terminals" },
    { "<leader>tp", "<cmd>FloatermNew python<cr>", desc = "Python Terminal" },
    { "<leader>tq", "<cmd>FloatermNew --wintype=popup --height=10<cr>", desc = "Quick Terminal" },
    { "<leader>ts", "<cmd>FloatermShow!<cr>", desc = "Show Terminals" },
    { "<leader>tt", "<cmd>FloatermToggle<cr>", desc = "Toggle Terminal" },
    -- markdown
    { "<leader>md", group = "render-markdown" },
    { "<leader>mde", "<cmd>RenderMarkdown enable<cr>", desc = "Render Markdown enable" },
    { "<leader>mdd", "<cmd>RenderMarkdown disable<cr>", desc = "Render Markdown disable" },
    { "<leader>mdt", "<cmd>RenderMarkdown toggle<cr>", desc = "Render Markdown toggle" },
    -- Copilot
    { "<leader>cp", group = "copilot" },
    { "<leader>cps", "<cmd>Copilot status<cr>", desc = "Copilot status" },
    { "<leader>cpe", "<cmd>Copilot enable<cr>", desc = "Copilot enable" },
    { "<leader>cpd", "<cmd>Copilot disable<cr>", desc = "Copilot disable" },
    -- LSP
    { "<leader>l", group = "lsp" },
    { "<leader>ld", function() vim.lsp.buf.definition() end, desc = "Go to Definition" },
    { "<leader>lr", function() vim.lsp.buf.references() end, desc = "References" },
    { "<leader>ln", function() vim.lsp.buf.rename() end, desc = "Rename" },
    { "<leader>lh", function() vim.lsp.buf.hover() end, desc = "Hover" },
    -- Diagnostics
    { "<C-j>", function() vim.diagnostic.goto_next() end, desc = "Next Diagnostic" },
    { "<C-k>", function() vim.diagnostic.goto_prev() end, desc = "Previous Diagnostic" },
    -- Direct mappings
    { "gd", function() vim.lsp.buf.definition() end, desc = "Go to Definition" },
    { "gr", function() vim.lsp.buf.references() end, desc = "References" },
    { "K", function() vim.lsp.buf.hover() end, desc = "Hover" },
  })

return wk
