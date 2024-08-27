local ok, wk = pcall(require, "which-key")

if not ok then
  return
end

wk.add({
    -- finder
    { "<leader>f", group = "finder" },
    { "<leader>fb", "<cmd>lua require('telescope.builtin').file_browser()<cr>", desc = "File Browser" },
    { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Live Grep" },
    { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", desc = "Help Tags" },
    { "<leader>ft", "<cmd>lua require('telescope.builtin').buffers()<cr>", desc = "Search Buffers" },
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
  })

return wk
