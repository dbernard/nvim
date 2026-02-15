-- lua/config/lspconfig.lua

-- Enable LSP completion with nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- If nvim-lspconfig isn't installed yet, bail (keeps startup resilient)
local ok_lspconfig = pcall(require, "lspconfig")
if not ok_lspconfig then
  return
end

-- Pick a pylsp command that works across environments
local function pylsp_cmd()
  local candidates = {
    vim.fn.expand("~/.venvs/nvim/bin/pylsp"), -- your mac venv
    "pylsp",                                  -- whatever is on PATH (codespaces, project venv, etc.)
  }

  for _, c in ipairs(candidates) do
    if c == "pylsp" then
      if vim.fn.executable("pylsp") == 1 then
        return { "pylsp" }
      end
    else
      if vim.fn.executable(c) == 1 then
        return { c }
      end
    end
  end

  return nil
end

local cmd = pylsp_cmd()
if cmd then
  vim.lsp.config("pylsp", {
    cmd = cmd,
    capabilities = capabilities,
    settings = {
      pylsp = {
        plugins = {
          jedi_completion = { enabled = true },
          jedi_hover = { enabled = true },
          jedi_references = { enabled = true },
          jedi_signature_help = { enabled = true },
          jedi_symbols = { enabled = true },

          autopep8 = { enabled = false },
          yapf = { enabled = false },

          flake8 = { enabled = false },
          pylint = { enabled = false },
          pycodestyle = { enabled = false },
          pydocstyle = { enabled = false },
          pyflakes = { enabled = false },

          rope_completion = { enabled = false },
          rope_autoimport = { enabled = false },
        },
      },
    },
  })

  vim.lsp.enable("pylsp")
else
  -- Optional: keep this quiet if you prefer
  vim.schedule(function()
    vim.notify("pylsp not found (not installed or not on PATH); Python LSP disabled", vim.log.levels.WARN)
  end)
end

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

-- Diagnostic signs (blank text = rely on number/underline/virtual text)
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
