local ok, colorizer = pcall(require, "colorizer")

if not ok then
  return
end

colorizer.setup({
  filetypes = { "*" },
  options = {
    -- css preset: color names, #RGB/#RRGGBB/#RRGGBBAA hex, rgb()/hsl() functions
    parsers = { css = true },
  },
})
