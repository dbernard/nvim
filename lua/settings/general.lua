-- General Neovim settings
local opt = vim.opt
local g = vim.g

-- Leader key
g.mapleader = " "

-- Basic settings
opt.hidden = true                -- Required for multiple buffers
opt.wrap = false                 -- Display long lines as just one line
opt.encoding = "utf-8"           -- The encoding displayed
opt.pumheight = 10              -- Shrink the popup menu
opt.fileencoding = "utf-8"       -- Encoding written to file
opt.ruler = true                 -- Show cursor position always
opt.cmdheight = 2                -- More space for displaying messages
opt.iskeyword:append("-")        -- Treat dash separated words as a word text object
opt.mouse = "a"                  -- Enable mouse
opt.splitbelow = true            -- Horizontal splits always below
opt.splitright = true            -- Vertical splits always right
opt.conceallevel = 0             -- Shows `` in markdown files
opt.tabstop = 2                  -- Insert 2 spaces for a tab
opt.shiftwidth = 2               -- Change the number of space characters inserted for indentation
opt.smarttab = true              -- Makes tabbing smarter - will realize we set 2 vs 4
opt.expandtab = true             -- Converts tabs to spaces
opt.smartindent = true           -- Makes indenting smarter
opt.autoindent = true            -- Better auto indenting
opt.laststatus = 2               -- Always show the last status line
opt.number = true                -- Line numbers
opt.cursorline = true            -- Enable highlighting of the current line
opt.background = "dark"          -- Tells vim what the background color looks like
opt.showtabline = 2              -- Always show tabs
opt.showmode = false             -- We don't need to see -- INSERT -- anymore
opt.backup = false               -- Recommended by coc
opt.writebackup = false          -- Recommended by coc
opt.updatetime = 300             -- Faster completion
opt.timeoutlen = 500             -- Faster than default of 1000ms (which-key plug)
opt.clipboard = "unnamedplus"    -- Copy / Paste between vim and everything else
opt.termguicolors = true         -- Set to true for colorizer
opt.colorcolumn = "80,120"       -- Set a ruler at 80 characters
opt.wrapscan = false             -- Don't wrap around buffer when searching

-- Format options
opt.formatoptions:remove("cro")  -- Stop newline continuation of comments

-- Auto source when writing to init.lua
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = vim.env.MYVIMRC,
  command = "source %"
})

-- Enable syntax highlighting and filetype detection
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

-- Disable Copilot by default
g.copilot_enabled = false
