-- Confirm available
local ok, ls = pcall(require, "luasnip")
if not ok then
  return  -- plugin not available yet
end

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Configure LuaSnip
ls.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
})

-- Basic LuaSnip key mappings
-- Insert-mode <Tab> is a Vimscript expr map (not a Lua callback) so copilot.vim
-- can wrap it: <Tab> accepts a Copilot suggestion when one is shown, and
-- otherwise falls through to expanding/jumping the snippet.
vim.cmd([[imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']])

vim.keymap.set({"i", "s"}, "<S-Tab>", function()
  return ls.jumpable(-1) and "<Plug>luasnip-jump-prev" or "<S-Tab>"
end, {silent = true, expr = true, remap = true})

vim.keymap.set({"s"}, "<Tab>", function()
  return ls.jumpable(1) and "<Plug>luasnip-jump-next" or "<Tab>"
end, {silent = true, expr = true, remap = true})

-- Load snippets from lua/snippets/ directory
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets/"})
