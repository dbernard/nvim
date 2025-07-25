local ok, ll = pcall(require, 'lualine')

if not ok then
  return
end

ll.setup({
  options = {
    icons_enabled = true,
    theme = 'onedark'
  },
  tabline = {
    lualine_a = {
      {
        'buffers',
        mode = 0,
      },
    }
  }
})

return ll
