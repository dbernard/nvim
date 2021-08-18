local wk = require "which-key"

wk.register({
  t = {
    name = "+terminal",
    q = { "<cmd>FloatermNew --wintype=popup --height=10<cr>", "Quick Terminal" }, -- create a new popup footer terminal
    t = { "<cmd>FloatermToggle<cr>", "Toggle Terminal" }, -- toggle a terminal
    p = { "<cmd>FloatermNew python<cr>", "Python Terminal" }, -- open a python shell
    f = { "<cmd>FloatermNew fzf<cr>", "fzf Terminal" }, -- open an fzf session
  },
}, { prefix = "<leader>" })
