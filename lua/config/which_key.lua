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
  })

return wk
