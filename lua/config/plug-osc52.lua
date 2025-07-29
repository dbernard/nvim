-- Confirm available
local ok, osc52 = pcall(require, "osc52")
if not ok then
  return  -- plugin not available yet
end

function copy()
  if vim.v.event.operator == 'y' and vim.v.event.regname == '' then
    require('osc52').copy(vim.fn.getreg('"'))
  end
end

vim.api.nvim_create_autocmd('TextYankPost', {callback = copy})
