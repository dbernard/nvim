local ls = require("luasnip")
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
vim.keymap.set({"i"}, "<Tab>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  else
    return "<Tab>"
  end
end, {silent = true, expr = true})

vim.keymap.set({"i", "s"}, "<S-Tab>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  else
    return "<S-Tab>"
  end
end, {silent = true, expr = true})

vim.keymap.set({"s"}, "<Tab>", function()
  if ls.jumpable(1) then
    ls.jump(1)
  end
end, {silent = true})

-- Load snippets from lua/snippets/ directory
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets/"})