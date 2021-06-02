require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "javascript", "lua", "bash", "tsx", "html", "css" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = { enable = true },
}
