local ok, ts = pcall(require, "nvim-treesitter")

if not ok then
  return
end

-- nvim-treesitter (main branch) only installs parsers; highlighting and
-- indent are enabled per-buffer below. Installing needs the tree-sitter CLI.
if vim.fn.executable("tree-sitter") == 1 then
  ts.install({ "python", "javascript", "typescript", "lua", "bash", "tsx", "html", "css", "markdown", "markdown_inline" })
else
  vim.schedule(function()
    vim.notify("tree-sitter CLI not found; treesitter parsers won't be installed", vim.log.levels.WARN)
  end)
end

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    -- no-op for filetypes without an installed parser
    if not pcall(vim.treesitter.start, args.buf) then
      return
    end
    if args.match ~= "python" then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
