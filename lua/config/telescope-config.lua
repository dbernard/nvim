-- Confirm available
local ok, telescope = pcall(require, "telescope")
if not ok then
  return  -- plugin not available yet
end

-- Telescope configuration with performance tweaks
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    -- Performance settings
    results_limit = 1000,           -- Limit results to prevent UI freezing
    timeout = 5000,                 -- 5 second timeout for searches
    
    -- File sorting
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    
    -- Better file ignoring
    file_ignore_patterns = {
      "node_modules/",
      ".git/",
      "dist/",
      "build/",
      "target/",
      "*.pyc",
      "*.pyo",
      "__pycache__/",
      ".pytest_cache/",
      ".coverage",
      "*.min.js",
      "*.min.css",
      "*.log",
      "*.tmp",
      "*.temp",
      ".DS_Store",
      "Thumbs.db",
    },
    
    -- UI settings
    prompt_prefix = "🔍 ",
    selection_caret = "➤ ",
    entry_prefix = "  ",
    initial_mode = "insert",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    
    -- Key mappings
    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-c>"] = actions.close,        -- Easy escape from stuck searches
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
      },
      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,
      },
    },
  },
  
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
      results_limit = 500,            -- Lower limit for file searches
    },
    live_grep = {
      additional_args = function(opts)
        return {"--hidden", "--glob", "!.git/*"}
      end,
      results_limit = 300,            -- Lower limit for grep searches
      timeout = 3000,                 -- 3 second timeout for grep
    },
    grep_string = {
      results_limit = 200,
      timeout = 2000,
    },
    buffers = {
      results_limit = 100,
    },
  },
  
  extensions = {
    -- Add any extensions here if needed
  }
})

-- Load extensions if they exist
-- pcall(require('telescope').load_extension, 'fzf')
