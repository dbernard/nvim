-- LSP Configuration
local lspconfig = require('lspconfig')

-- Disable default LSP completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false

-- Python LSP (pylsp)
lspconfig.pylsp.setup {
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        -- Disable completion plugins
        jedi_completion = { enabled = false },
        jedi_hover = { enabled = true },
        jedi_references = { enabled = true },
        jedi_signature_help = { enabled = false },
        jedi_symbols = { enabled = true },
        
        -- Disable formatting (handled by conform.nvim)
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        
        -- Disable linting (handled by nvim-lint)
        flake8 = { enabled = false },
        pylint = { enabled = false },
        pycodestyle = { enabled = false },
        pydocstyle = { enabled = false },
        pyflakes = { enabled = false },
        
        -- Keep rope for refactoring
        rope_completion = { enabled = false },
        rope_autoimport = { enabled = false },
      }
    }
  }
}

-- Key mappings handled by which-key configuration

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- Diagnostic signs
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end