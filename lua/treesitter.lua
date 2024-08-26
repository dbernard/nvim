local ok, tsconf = pcall(require, "nvim-treesitter.configs")

if not ok then
  return
end

tsconf.setup {
  ensure_installed = { "python", "javascript", "lua", "bash", "tsx", "html", "css", "markdown", "markdown_inline" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = { enable = true },
  indent = { enable = true, disable = { "python" }},
}
