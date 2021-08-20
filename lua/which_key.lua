local wk = require "which-key"

wk.register({
  t = {
    name = "+terminal",
    q = { "<cmd>FloatermNew --wintype=popup --height=10<cr>", "Quick Terminal" }, -- create a new popup footer terminal
    t = { "<cmd>FloatermToggle<cr>", "Toggle Terminal" }, -- toggle a terminal
    p = { "<cmd>FloatermNew python<cr>", "Python Terminal" }, -- open a python shell
    f = { "<cmd>FloatermNew fzf<cr>", "fzf Terminal" }, -- open an fzf session
  },
  f = {
    name = "+finder",
    f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find Files" },
    g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Live Grep" },
    b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Search Buffers" },
    h = { "<cmd>lua require('telescope.builtin').help_tags()<cr>", "Help Tags" },
    b = { "<cmd>lua require('telescope.builtin').file_browser()<cr>", "File Browser" },
  },
}, { prefix = "<leader>" })
