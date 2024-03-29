local ok, wk = pcall(require, "which-key")

if not ok then
  return
end

wk.register({
  t = {
    name = "+terminal",
    q = { "<cmd>FloatermNew --wintype=popup --height=10<cr>", "Quick Terminal" }, -- create a new popup footer terminal
    t = { "<cmd>FloatermToggle<cr>", "Toggle Terminal" }, -- toggle a terminal
    p = { "<cmd>FloatermNew python<cr>", "Python Terminal" }, -- open a python shell
    f = { "<cmd>FloatermNew fzf<cr>", "fzf Terminal" }, -- open an fzf session
    s = { "<cmd>FloatermShow!<cr>", "Show Terminals" }, -- show ALL terminals
    h = { "<cmd>FloatermHide!<cr>", "Hide Terminals" }, -- hide ALL terminals
  },
  f = {
    name = "+finder",
    f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find Files" },
    g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep" },
    t = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Search Buffers" },
    h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help Tags" },
    b = { "<cmd>lua require('telescope.builtin').file_browser()<cr>", "File Browser" },
  },
  s = {
    name = "+session",
    s = { "<cmd>SessionSave<cr>", "Session Save" },
    l = { "<cmd>SessionLoad<cr>", "Session Load" },
  },
  g = {
    name = "+git",
    s = { "<cmd>Git st<cr>", "Git Status" },
    d = { "<cmd>Git diff<cr>", "Git Diff" },
    b = { "<cmd>Git blame<cr>", "Git Blame" },
    l = { "<cmd>Gclog -10<cr>", "Git log (limit: 10)" },
  },
}, { prefix = "<leader>" })

return wk
